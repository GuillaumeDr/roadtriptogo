class AddProjectToTravelers < ActiveRecord::Migration[6.1]
  def change
    add_reference :travelers, :project, null: false, foreign_key: true
  end
end
