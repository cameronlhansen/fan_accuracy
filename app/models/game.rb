class Game < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :home_team_id, :presence => true

  validates :over_under, :numericality => true

  validates :spread, :numericality => true

end
