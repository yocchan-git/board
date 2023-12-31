class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            reset_session
            login @user
            flash[:notice] = "ログイン成功"
            redirect_to posts_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def destroy
        log_out
        redirect_to "/login", status: :see_other
    end
end
