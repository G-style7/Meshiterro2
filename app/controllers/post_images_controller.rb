class PostImagesController < ApplicationController
  def new
   @post_image = PostImage.new #@post_image には form_with に渡すための「空のモデル」を用意
  end

  def create
   @post_image = PostImage.new(post_image_params)
   @post_image.user_id = current_user.id
   #PostImage モデルに紐づいた user_id の値を操作できる
   #(current_user)
   #@post_image(投稿データ)のuser_idを、current_user.id(今ログインしているユーザーの ID)に
   #指定することで投稿データに、今ログイン中のユーザーの ID を持たせることができる。
   @post_image.save
   redirect_to post_images_path
  end

  def index
   @post_images = PostImage.all
  end

  def show
   @post_image = PostImage.find(params[:id])
  end
  
  def destroy
   @post_image = PostImage.find(params[:id])
   @post_image.destroy
   redirect_to post_images_path
  end

  private

  def post_image_params #フォームで入力されたデータが、投稿データとして許可されているパラメータかチェックする
    params.require(:post_image).permit(:shop_name, :image, :caption) #require 必要とする. permit許可する
  end

end
