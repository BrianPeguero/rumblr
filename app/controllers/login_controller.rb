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
        @login  = Login.new(login_params)
        pp @login

        @user = User.find_by(email: "#{params[:user][:email]}")
        pp @user

        if @user != nil
            #if @user.password == params[:user][:password]
            if @user.password == params[:user][:password]
                session[:user_id] = @user.id
                redirect_to :controller => "user", :action => "index"
            end
        else
            if params[:user][:email] == ""
                @error = "username can not be blank"
            elsif params[:user][:password] == ""
                @error = "password  can not be blank"
            elsif params[:user][:password] == "" and params[:user][:password] == ""
                @error = "username and password can not be blank"
            elsif @user == nil
                @error = "could not find you in our records try again"
            end
            render "new"
        end

    end

    private
        def login_params
            params.require(:user).permit(:email, :password)
        end
end