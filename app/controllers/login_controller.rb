class LoginController < ApplicationController
    def index
    end

    def show
    end

    def new
    end

    def create
        @user = User.find_by(email: "#{params[:user][:email]}")
        
        if @user != nil
            if @user.password == params[:user][:password]
                session[:user_id] = @user.id
                redirect_to :controller => "user", :action => "index"
            end
        else
            render "index"
        end

    end
end
