class Step < ApplicationRecord
  has_many :notes
  has_many :events
  belongs_to :project

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
