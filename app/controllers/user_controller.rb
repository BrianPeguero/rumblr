class UserController < ApplicationController

    def index
        @user = User.find(session[:user_id])
        # @posts = @user.post

        @users = User.all
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render "new"
        end
    end

    def show
        @user = User.find(params[:id])

        @posts = @user.post
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

end
