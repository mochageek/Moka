class LikesController < ApplicationController
    protect_from_forgery
    def create
        like = current_user.likes.create(coffee_id: params[:coffee_id]) #user_idとcoffee_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(coffee_id: params[:coffee_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
end
