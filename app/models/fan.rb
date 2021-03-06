class Fan < ApplicationRecord
  # Direct associations

  belongs_to :primary_team,
             :class_name => "Team",
             :counter_cache => true

  has_many   :polls,
             :dependent => :destroy

  has_many   :picks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :primary_team_id, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
