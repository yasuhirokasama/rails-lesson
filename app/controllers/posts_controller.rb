class PostsController < ApplicationController
  
  before_action :authenticate_user
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}
  
  def index
     @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    # showビューのURLにおけるid番号（paramsに入っている）をPostテーブルから取得し@postに代入せよ
    @user = @post.user
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
      )
    if @post.save
      flash[:notice] ="投稿を作成しました！！！"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      # renderメソッドは、URLではなく、"フォルダ/ファイル"を指定するので要注意
      # 更にはファイルの.拡張子は要らない
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました（残念〜）"
    redirect_to("/posts/index")
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありませんよ！"
      redirect_to("/posts/index")
    end
  end
  
end
