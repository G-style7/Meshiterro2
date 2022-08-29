class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.string :shop_name
      t.text :caption #画像の説明
      t.integer :user_id

      t.timestamps
    end
  end
end
