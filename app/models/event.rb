class Event < ApplicationRecord
  belongs_to :step
  has_one_attached :photo

  validates :event_type, :name, :price, presence: true

  EVENT_DURATION = ['Matin', 'Midi', 'Après-midi', 'Soir']
  EVENT_TYPE = ['Logements', 'Restaurants', 'Activités']
end
