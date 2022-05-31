class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :type
      t.string :name
      t.string :address
      t.string :duration
      t.string :description
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end
