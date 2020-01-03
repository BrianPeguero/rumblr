class PostController < ApplicationController

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            pp @post
            render "new"
        end
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :body)

            all_params = {user_id: session[:user_id], title: params[:post][:title], body: params[:post][:body]}
        end
end