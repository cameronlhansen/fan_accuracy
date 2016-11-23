class Team < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :logo, :presence => true

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
