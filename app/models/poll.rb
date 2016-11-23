class Poll < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :game_id, :presence => true

  validates :question, :presence => true

end
