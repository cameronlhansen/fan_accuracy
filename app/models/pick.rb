class Pick < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :game_id, :presence => true

  validates :type, :uniqueness => { :scope => [:fan_id] }

  validates :type, :presence => true

end
