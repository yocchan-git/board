class UserController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(name: params[:name],
                         email: params[:email],
                         password: params[:password],
                         image: "default.jpg")

        if @user.save
            reset_session
            login @user
            flash[:notice] = "ユーザー登録が成功しました。"
            # # 画像があれば画像を上書きする
            # if params[:image]
            #     image = params[:image]
            #     File.binwrite("app/assets/images/#{@user.id}.jpg",image.read)
            # end
            redirect_to posts_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if params[:image]
            image_name = params[:image]
            image_db_name = @user.id.to_s + ".jpg"
            File.binwrite("app/assets/images/#{@user.id}.jpg",image_name.read)
        else
            image_db_name = "default.jpg"
        end

        if @user.update(name: params[:name],
                        email: params[:email],
                        image: image_db_name)
            flash[:notice] = "編集に成功しました。"
            redirect_to "/user/#{@user.id}"
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    # private

    # def user_params
    #     params.require(:user).permit(:name, :email, :password)
    # end
end
