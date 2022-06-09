class Event < ApplicationRecord
  belongs_to :step
  has_one_attached :photo

  EVENT_DURATION = ['Matin', 'Midi', 'Après-midi', 'Soir']
  EVENT_TYPE = ['Logements', 'Restaurants', 'Activités']
end
