# == Schema Information
#
# Table name: trackings
#
#  id         :integer          not null, primary key
#  start      :datetime
#  stop       :datetime
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tracking < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
end
