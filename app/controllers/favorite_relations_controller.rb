class FavoriteRelationsController < ApplicationController
    before_action :logged_in_user
    
    def create
        @micropost = Micropost.find(params[:micropost_id])
        current_user.fav(@micropost)
    end
    
    def destroy
        @micropost = current_user.favorite_relations.find(params[:id]).micropost
        current_user.unfav(@micropost)
    end


end
