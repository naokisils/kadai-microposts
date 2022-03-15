class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @pagy, @microposts = pagy(current_user.feed_microposts.order(id: :desc))
    end  
  end
   
  def create
    @micropost= current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success]= "メッセージを投稿しました。"
      redirect_to root_url
    else
      flash.now[:danger]= "メッセージの投稿に失敗しました。"
      render "toppages/index"
    end 
  end  
end
