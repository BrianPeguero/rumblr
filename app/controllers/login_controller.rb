class LoginController < ApplicationController
    def index
        @user = User.new
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(login_params)
        pp @user

        @user = User.find_by(email: "#{params[:user][:email]}")
        
        if @user != nil
            #if @user.password == params[:user][:password]
            if @user.password == params[:user][:password]
                session[:user_id] = @user.id
                redirect_to :controller => "user", :action => "index"
            end
        else
            render "new"
        end

    end

    private
        def login_params
            params.require(:user).permit(:email, :password)
        end
end