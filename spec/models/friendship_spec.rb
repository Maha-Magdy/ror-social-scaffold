require 'rails_helper'

RSpec.describe Friendship, type: :model do

    first_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
        password: '123456', password_confirmation: '123456')
    first_user.save
    second_user = User.new(name: 'Mai Magdy', email: 'mai_magdy@gmail.com',
            password: '123456', password_confirmation: '123456')
    second_user.save

    describe 'Validations' do
    
        describe 'sender_id' do
            it 'must be present' do
                friendship = described_class.new
                expect(friendship).to_not be_valid
            end
        end

        describe 'receiver_id' do
            it 'must be present' do
                friendship = described_class.new
                expect(friendship).to_not be_valid
            end
        end

        describe 'sender_id and receiver_id' do
            it 'must be present' do
                friendship = described_class.new(sender: first_user, receiver: second_user)
                expect(friendship).to be_valid
            end
        end
    end
end