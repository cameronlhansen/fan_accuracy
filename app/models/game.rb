class Game < ApplicationRecord
  # Direct associations

  has_many   :polls,
             :dependent => :destroy

  has_many   :picks,
             :dependent => :destroy

  belongs_to :home_team,
             :class_name => "Team"

  # Indirect associations

  # Validations

  validates :away_team_id, :presence => true

  validates :game_date_time, :presence => true

  validates :home_team_id, :presence => true

  validates :over_under, :numericality => true

  validates :spread, :numericality => true

end
