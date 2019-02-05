class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.text :shop_name
      t.text :image_id
      t.text :caption
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
