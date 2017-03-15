require 'rails_helper'

RSpec.describe User, type: :model do
  let (:test_user) {User.new(name: "Carlos", email: "Carlos@gmail.com", password: "password" )}
  describe 'validations' do
      it 'saves a new user if successfully created'do
        expect{test_user.save}.to change{User.count}.by(1)
      end

      it 'saves a new user if name is provided'do
        if test_user.name = !nil
        expect{test_user.save}.to change{User.count}.by(1)
        end
      end


      it 'saves a new user if email is provided'do
        if test_user.email = !nil
        expect{test_user.save}.to change{User.count}.by(1)
        end
      end


      it 'does not add a user to the database if they are not created'do
        if  !test_user.save
        expect{test_user.save}.to change{User.count}.by(0)
        end
      end

      it 'does not add a user to the database if they violate not null in name'do
        if  test_user.name = nil
        expect{test_user.save}.to change{User.count}.by(0)
        end
      end

      it 'does not add a user to the database if they violate not null in name'do
        if  test_user.email = nil
        expect{test_user.save}.to change{User.count}.by(0)
        end
      end

      it 'does not add a user to the database if they violate not null in name'do
        if  test_user.password = nil
        expect{test_user.save}.to change{User.count}.by(0)
        end
      end

  end
end
