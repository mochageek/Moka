class CommentsController < ApplicationController
  before_action :authenticate_user!

def create
  coffee = Coffee.find(params[:coffee_id])
  comment = coffee.comments.build(comment_params) #buildを使い、contentとcoffee_idの二つを同時に代入
  comment.user_id = current_user.id
  if comment.save
    flash[:success] = "コメントしました"
    redirect_back(fallback_location: root_path) #直前のページにリダイレクト
  else
    flash[:success] = "コメントできませんでした"
    redirect_back(fallback_location: root_path) #直前のページにリダイレクト
  end
end

def destroy
  current_user.comments.find(params[:id]).destroy!
  flash[:notice] = 'コメントを削除しました'
  redirect_to("/coffees/#{params[:coffee_id]}")
end

private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
