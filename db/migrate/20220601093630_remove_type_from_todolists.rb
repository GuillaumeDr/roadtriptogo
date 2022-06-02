class RemoveTypeFromTodolists < ActiveRecord::Migration[6.1]
  def change
    remove_column :todolists, :type, :string
  end
end
