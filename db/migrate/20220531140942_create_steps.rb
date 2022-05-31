class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.date :start_date
      t.date :end_date
      t.string :city
      t.references  :project, foreign_key: true

      t.timestamps
    end
  end
end
