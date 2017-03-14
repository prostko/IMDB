require 'rails_helper'

RSpec.describe User, type: :model do
  let (:test_user) {User.new(name: "Carlos", email: "Carlos@gmail.com", password: "password" )}
  describe 'validations' do
      it 'saves a new user if successfully created'do
        expect{test_user.save}.to change{User.count}.by(1)
      end

      it 'does not add a user to the database if they are not created'do
        if  !test_user.save
        expect{test_user.save}.to change{User.count}.by(0)
      end
    end
  end
end
