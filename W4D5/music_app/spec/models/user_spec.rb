require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:dummy) { User.new(email: 'Ted', password: '123456') }

  describe 'attributes' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '#is_password?' do
    it 'returns true if it is the password' do
      expect(dummy.is_password?('123456')).to eq(true)
    end

    it "it returns false if it's not the password" do
      expect(dummy.is_password?('12345')).to eq(false)
    end
  end

  describe '#reset_session_token' do
    before(:each) do
      @old_token = dummy.session_token
      @new_token = dummy.reset_session_token!
    end

    it 'resets the session token' do
      expect(@old_token).not_to eq(dummy.session_token)
    end

    it 'returns the new session token' do
      expect(@new_token).to eq(dummy.session_token)
    end
  end

  describe '::find_by_credentials' do
    before(:each) { @user = User.create(email: 'Ted', password: '123456') }

    it 'returns the user with correct credentials' do
      expect(User.find_by_credentials('Ted', '123456')).to eq(@user)
    end

    it 'returns nil with incorrect credentials' do
      expect(User.find_by_credentials('a', 'b')).to eq(nil)
    end
  end

  describe 'associations' do
    it { should have_many(:notes).class_name('Note') }
  end
end
