class Event < ApplicationRecord
  belongs_to :step
  has_one_attached :photo
end
