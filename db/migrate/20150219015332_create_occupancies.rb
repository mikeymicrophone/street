class CreateOccupancies < ActiveRecord::Migration
  def change
    create_table :occupancies do |t|
      t.belongs_to :unit, index: true
      t.belongs_to :resident, index: true

      t.timestamps null: false
    end
    add_foreign_key :occupancies, :units
    add_foreign_key :occupancies, :residents
  end
end
