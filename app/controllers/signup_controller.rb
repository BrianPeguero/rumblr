class SignupController < ApplicationController

    def index
    end

    def show
    end

    def new
        @user = User.new()
    end

    def create
        #.new() and .save() are both active record methods to make it easier to save and create to the database
        @user = User.new(user_params)

        #if article does not com back after vailadtion with errors then it will show the article
        if @user.save
            session[:user_id] = @user.id
            redirect_to :controller => "user", :action => "index"
        else
            #else if article has an error the article/new route is rerendered with the error messages as well
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :name, :birthday)
        end
end
