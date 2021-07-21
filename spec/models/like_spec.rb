RSpec.describe Like, type: :model do
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
      new_post.save

      new_like = Like.new(user: new_user, post: new_post)

      expect(new_like).to be_valid
    end

    it 'will not be accepted if the same user try to like more than once on the same article' do
      new_user = User.new(name: 'Maha Magdy', email: 'maha_magdy@gmail.com',
                          password: '123456', password_confirmation: '123456')
      new_user.save

      new_post = Post.new(user: new_user,
                          content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
                              molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
                              numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
                              optio, eaque rerum! Provident similique accusantium nemo autem.')
      new_post.save

      new_first_like = Like.new(user: new_user, post: new_post)
      new_first_like.save

      new_second_like = Like.new(user: new_user, post: new_post)
      expect(new_second_like).to_not be_valid
    end
  end
end
