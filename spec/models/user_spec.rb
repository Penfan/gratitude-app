require 'rails_helper'

describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  context 'next_unique_handle' do
    it 'handle should use first name and first initial of last name' do
      handle = User.next_unique_handle("Whale Huang")
      expect(handle).to eq('whaleh')
    end

    it 'handle should ignore the middle name' do
      handle = User.next_unique_handle("Whale The Huang")
      expect(handle).to eq('whaleh')
    end

    it 'handle should use only first and last names' do
      handle = User.next_unique_handle("Whale Cow Hi Huang")
      expect(handle).to eq('whaleh')
    end

    it 'handle should use only first name when last name is empty' do
      handle = User.next_unique_handle("Whale")
      expect(handle).to eq('whale')
    end

  end

end
