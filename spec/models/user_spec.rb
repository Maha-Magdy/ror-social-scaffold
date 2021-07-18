require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validation' do
        it 'will be accepted if the user provide his/her name' do
            new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                password: '123456', password_confirmation: '123456')
            expect(new_user).to be_valid
        end

        it 'will not be accepted if the user don\'t provide his/her name' do
          new_user = User.new(email: 'maha_magdy@gmail.com',
            password: '123456', password_confirmation: '123456')
          expect(new_user).to_not be_valid
        end

        it 'will not be accepted if the user provide not unique email' do
          first_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
            password: '123456', password_confirmation: '123456')
          first_user.save
    
          second_user = User.new(name: 'Maha', email: 'maha_magdy@gmail.com',
              password: '123456', password_confirmation: '123456')
    
          expect(second_user).to_not be_valid
        end
    end
end