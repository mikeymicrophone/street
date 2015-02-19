class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.belongs_to :building, index: true
      t.integer :bedrooms
      t.integer :floor
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :units, :buildings
  end
end
