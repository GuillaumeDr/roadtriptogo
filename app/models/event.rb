class Event < ApplicationRecord
  belongs_to :step
  has_one_attached :photo

  EVENT_TYPE = ['Logements', 'Restaurants', 'Activités', 'Notes']
end
