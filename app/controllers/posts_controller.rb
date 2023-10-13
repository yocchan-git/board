class PostsController < ApplicationController
    before_action :post_only_login_user, only: [:edit, :update, :destroy]
    before_action :can_login_user, only: [:new, :create]

    def index
        @posts = Post.order(created_at: :desc)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @user = current_user
        @post = Post.new(post_params)
        @post.user_id = @user.id 
        if @post.save
            flash[:notice] = "投稿が成功しました。"
            redirect_to posts_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            flash[:notice] = "編集に成功しました。"
            redirect_to posts_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
        flash[:notice] = "削除に成功しました。"
        redirect_to posts_path
    end

    private

        def post_params
        params.require(:post).permit(:title, :content)
        end
end
