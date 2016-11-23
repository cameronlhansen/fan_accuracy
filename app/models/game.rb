class Game < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :spread, :numericality => true

end
