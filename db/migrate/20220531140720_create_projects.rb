class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :theme
      t.string :profil
      t.string :total_budget

      t.timestamps
    end
  end
end
