class AddSeasonToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :season, :string
  end
end
