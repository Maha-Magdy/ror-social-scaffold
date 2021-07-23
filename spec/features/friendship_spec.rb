require 'rails_helper'

RSpec.describe Friendship do
  describe 'friendship' do
    it 'should be able to initiate' do
      first_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                            password: '123456', password_confirmation: '123456')
      first_user.save
      second_user = User.new(name: 'Mai Magdy', email: 'mai_magdy@gmail.com',
                             password: '123456', password_confirmation: '123456')
      second_user.save

      Capybara.visit new_user_session_path

      Capybara.fill_in 'user_email', with: 'maha_magdy@gmail.com'
      Capybara.fill_in 'user_password', with: '123456'
      find('input[name="commit"]').click

      visit '/users'

      expect(page).to have_link('Send Friend Request', href: '/friendships?friend_id=2')
    end
  end
end
