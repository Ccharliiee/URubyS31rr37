class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "You've successfully logged in as User #{user.name}."
            redirect_to user
        else
            flash.now.alert = "The email or password was incorrect. Please try again"
            render :new, status: :bad_request
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end