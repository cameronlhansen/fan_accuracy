class Poll < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :fan_id, :presence => true

  validates :game_id, :presence => true

  validates :question, :presence => true

end
