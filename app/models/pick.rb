class Pick < ApplicationRecord
  # Direct associations

  belongs_to :game,
             :counter_cache => true

  belongs_to :fan,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :fan_id, :presence => true

  validates :game_id, :presence => true

  validates :type, :uniqueness => { :scope => [:fan_id] }

  validates :type, :presence => true

end
