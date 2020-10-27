class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create

    end

    def destroy

    end

    private
        def set_user_params
            params.require(:user).permit(:email, :password)
        end
end
