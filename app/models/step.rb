class Step < ApplicationRecord
  has_many :notes
  has_many :events, dependent: :destroy
  belongs_to :project

  validates :start_date, :city, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

end
