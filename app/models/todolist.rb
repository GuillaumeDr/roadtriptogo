class Todolist < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :project
end
