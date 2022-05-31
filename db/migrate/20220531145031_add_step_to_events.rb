class AddStepToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :step, null: false, foreign_key: true
  end
end
