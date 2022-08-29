class PostImage < ApplicationRecord
  has_one_attached :image
  #PostImage モデルには、ActiveStoreage を使って画像を持たせる
  belongs_to:user
  #「ユーザーに属する」
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
      image
  end
  

end
