class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #パスワードの正確性を検証
         :registerable, #ユーザ登録や編集、削除
         :recoverable, #パスワードをリセット
         :rememberable, #ログイン情報を保存
         :validatable #email のフォーマットなどのバリデーション

  has_many :post_images,dependent: :destroy
  #たくさん post_image を持っている.  #「1:Nの1側が削除されたとき、N側を全て削除する」という機能
  has_many :post_comments,dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end
end