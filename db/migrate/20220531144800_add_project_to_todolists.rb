class AddProjectToTodolists < ActiveRecord::Migration[6.1]
  def change
    add_reference :todolists, :project, null: false, foreign_key: true
  end
end
