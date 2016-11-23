class Game < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :over_under, :numericality => true

  validates :spread, :numericality => true

end
