class Traveler < ApplicationRecord
  belongs_to :user, :project
end
