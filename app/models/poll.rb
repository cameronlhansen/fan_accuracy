class Poll < ApplicationRecord
  # Direct associations

  belongs_to :game

  belongs_to :fan

  # Indirect associations

  # Validations

  validates :fan_id, :presence => true

  validates :game_id, :presence => true

  validates :question, :presence => true

end
