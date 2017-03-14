require 'rails_helper'

RSpec.describe User, type: :model do
  let (:test_user) {User.new(name: "Carlos", email: "Carlos@gmail.com", password: "password" )}
  describe 'validations' do
    context 'will raise an error if ' do
      it 'when the name is empty'do

      end
    end
  end
end
