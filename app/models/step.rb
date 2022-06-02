class Step < ApplicationRecord
  has_many :notes
  has_many :events
  belongs_to :project
end
