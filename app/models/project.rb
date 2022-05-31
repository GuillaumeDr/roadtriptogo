class Project < ApplicationRecord
  has_one :todolist
  has_many :steps, :travelers
  has_many :users, through: :travelers
  has_one_attached :photo

end
