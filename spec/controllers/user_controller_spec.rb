require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let(:user) {User.create!(name: "Carlos", email: "Carlos@gmail.com", password: "password" )}
  describe "GET #show" do
    it "rsponds with status code 200" do
       get :show, {id: user.id}
       expect(response).to have_http_status 200
    end
  end



end
