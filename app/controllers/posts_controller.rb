class PostsController < ApplicationController
  def index
     @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    # showビューのURLにおけるid番号（paramsに入っている）をPostテーブルから取得し@postに代入せよ
  end
  
  def new
  end
  
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end
  
end
