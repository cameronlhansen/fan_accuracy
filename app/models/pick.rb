class Pick < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :fan_id, :presence => true

  validates :game_id, :presence => true

  validates :type, :uniqueness => { :scope => [:fan_id] }

  validates :type, :presence => true

end
