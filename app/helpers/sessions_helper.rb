module SessionsHelper
    # 渡されたユーザーでログインする
    def login(user)
        session[:user_id] = user.id
    end

    # ログインしているユーザーを返す
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # ログインしているかをチェックする
    def logged_in?
        !current_user.nil?
    end

    # 現在のユーザーをログアウトする
    def log_out
        reset_session
        @current_user = nil   # 安全のため
    end
end
