# == Schema Information
#
# Table name: trackings
#
#  id          :integer          not null, primary key
#  start       :datetime
#  stop        :datetime
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

require 'spec_helper'

describe Tracking do
  describe 'valid data' do
    it 'should have a valid user associated' do
      tracking = create(:tracking)
      tracking.user.should_not be_nil
      tracking.should be_valid
    end
  end
  describe 'invalid data' do
    it 'should fail validations if it doesn\'t belong to any user' do
      tracking = build(:tracking, user: nil)
      tracking.should have(1).errors_on(:user)
    end
  end
end
