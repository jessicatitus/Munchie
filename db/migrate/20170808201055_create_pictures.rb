class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :img_url, null: false
      t.belongs_to :restaurant

      t.timestamps null: false
    end
  end
end
