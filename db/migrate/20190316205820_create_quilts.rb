class CreateQuilts < ActiveRecord::Migration[5.2]
  def change
    create_table :quilts do |t|
      t.string :name
      t.text :description
      t.string :size
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
