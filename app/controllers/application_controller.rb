class ApplicationController < ActionController::Base
    include SessionsHelper

    def only_login_user
        if current_user
            @post = Post.find(params[:id])
            unless @current_user.id == @post.user_id
                flash[:notice] = "権限がありません。"
                redirect_to posts_path
            end
        else
            flash[:notice] = "権限がありません。"
            redirect_to login_path
        end
    end

    def can_login_user
        unless current_user
            flash[:notice] = "権限がありません"
            redirect_to login_path
        end
    end
end
