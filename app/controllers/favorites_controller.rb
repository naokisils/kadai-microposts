class FavoritesController < ApplicationController
  
  def create
    micropost= Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success]="お気に入り登録しました。"
    redirect_to root_url
  end

  def destroy
    micropost= Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:danger]="お気に入りから削除しました。"
    redirect_to root_url
  end
end
