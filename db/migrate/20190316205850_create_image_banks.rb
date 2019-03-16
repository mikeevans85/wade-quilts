class CreateImageBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :image_banks do |t|
      t.integer :quilt_id
      t.text :description

      t.timestamps
    end
  end
end
