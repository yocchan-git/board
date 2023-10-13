class UserController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(name: params[:name],
                         email: params[:email],
                         password: params[:password])
        if @user.save
            reset_session
            login @user
            flash[:notice] = "ユーザー登録が成功しました。"
            redirect_to "/"
        else
            render 'new', status: :unprocessable_entity
        end
    end

    # private

    # def user_params
    #     params.require(:user).permit(:name, :email, :password)
    # end
end
