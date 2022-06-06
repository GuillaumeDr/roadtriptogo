class AddCoordinatesToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :latitude, :float
    add_column :steps, :longitude, :float
  end
end
