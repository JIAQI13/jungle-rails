require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it  'initial test with four fields' do
        @user = User.new(
            name:"onetwothree",
            email:"123@123",
            password_confirmation:'aaaaaaa',
            created_at:2.day.ago,
            updated_at:1.day.ago)
        @user.valid?
        expect(@user).to be_valid
    end
  end
end
