class CommentController < ApplicationController
    before_action :comment_only_login_user, only: [:edit, :update, :destroy]
    before_action :comment_can_write_anothe_user, only: [:new, :create]

    def new
        @comment = Comment.new
        @user_id = params[:user_id]
        @post_id = params[:post_id]
    end

    def create
        @comment = Comment.new(comment: params[:comment],
                               user_id: params[:user_id],
                               post_id: params[:post_id])
        if @comment.save
            flash[:notice] = "コメントを送信しました"
            redirect_to posts_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @comment.update(comment: params[:comment])
            flash[:notice] = "編集に成功しました。"
            redirect_to posts_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @comment.destroy
        flash[:notice] = "コメントを削除しました。"
        redirect_to posts_path
    end

    # private

    #     def comment_params
    #         params.require(:comment).permit(:comment, :user_id, :post_id)
    #     end
end
