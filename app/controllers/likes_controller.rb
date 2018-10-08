class LikesController < ApplicationController
  def create
    user = Micropost.find(params[:micropost_id])
    current_user.like(user)
    flash[:success] = 'お気に入り登録しました。'
     redirect_back(fallback_location: root_path)
  end
  
  def show
    
    
    
  end

  def destroy
    user = User.find(params[:micropost_id])
    current_user.unlike(user)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to  user
  end
  
  

end
