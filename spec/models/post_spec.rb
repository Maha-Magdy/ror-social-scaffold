require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'will be accepted if all the needed properties provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')

      new_user.save
      new_post = Post.new(user: new_user,
                          content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                                        molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                        numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                        optio, eaque rerum! Provident similique accusantium nemo autem.')
      expect(new_post).to be_valid
    end

    it 'will not be accepted if the content is not provided' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')

      new_user.save
      new_post = Post.new(user: new_user)
      expect(new_post).to_not be_valid
    end

    it 'will not be accepted if the provided content exceed the maximum length' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')

      new_user.save
      new_post = Post.new(user: new_user,
                          content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                                  molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                                  numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                                  optio, eaque rerum! Provident similique accusantium nemo autem. Lorem ipsum dolor
                                  sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint
                                  commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum
                                  quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident
                                  similique accusantium nemo autem.Lorem ipsum dolor
                                  sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint
                                  commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum
                                  quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident
                                  similique accusantium nemo autem.')
      expect(new_post).to_not be_valid
    end
  end
end
