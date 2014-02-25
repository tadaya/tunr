class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :user, through: :playlist

  validates :playlist, presence: true

end