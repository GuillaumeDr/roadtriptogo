class Project < ApplicationRecord
  has_one :todolist, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :events, through: :steps
  has_many :users, through: :travelers
  has_many :travelers, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true

  attr_accessor :collab

  PROJECT_SEASON = ['automne', 'hiver', 'printemps', 'été']
  PROJECT_TRANSPORT = ['voiture', 'train', 'avion']
  PROJECT_THEME = ['nature', 'gastronomie', 'culture']
  PROJECT_PROFIL = ['€', '€€', '€€€', '€€€€']

  def get_data
    data = Hash.new(0)
    events.each do |event|
      data[event.event_type] += event.price
    end
    data
  end
end
