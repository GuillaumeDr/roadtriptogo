class Step < ApplicationRecord
  has_many :notes, :events
  belongs_to :project
end
