class Fan < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :primary_team_id, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
