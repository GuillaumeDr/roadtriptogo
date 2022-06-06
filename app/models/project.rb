class Project < ApplicationRecord
  has_one :todolist
  has_many :steps
  has_many :events, through: :steps
  has_many :users, through: :travelers
  has_many :travelers
  has_one_attached :photo

  PROJECT_SEASON = ['automne', 'hiver', 'printemps', 'été']
  PROJECT_TRANSPORT = ['voiture', 'train', 'avion']
  PROJECT_THEME = ['nature', 'gastronomie', 'culture']
  PROJECT_PROFIL = ['Backpack €', 'Touriste €€', 'Confortable €€€', 'Luxe €€€€']
end
