class UserController < ApplicationController
     def show
     end
     private
     def set_user
        params.require(:user).permit(:id)
     end
end
  