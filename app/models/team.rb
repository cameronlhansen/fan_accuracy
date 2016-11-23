class Team < ApplicationRecord
  # Direct associations

  has_many   :games,
             :foreign_key => "home_team_id",
             :dependent => :nullify

  has_many   :fans,
             :foreign_key => "primary_team_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

  validates :logo, :presence => true

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
