class Poll < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :question, :presence => true

end
