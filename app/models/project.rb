class Project < ApplicationRecord
  has_one :todolist
  has_many :steps, dependent: :destroy
  has_many :users, through: :travelers
  has_many :travelers
  has_one_attached :photo

  PROJECT_SEASON = ['automne', 'hiver', 'printemps', 'été']
  PROJECT_TRANSPORT = ['voiture', 'train', 'avion']
  PROJECT_THEME = ['nature', 'gastronomie', 'culture']
  PROJECT_PROFIL = ['€', '€€', '€€€', '€€€€']
end
