class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :content
      t.date :date
      t.references  :step, foreign_key: true
      t.timestamps
    end
  end
end
