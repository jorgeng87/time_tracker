require 'spec_helper'

describe SessionsController do

  describe "POST create" do
    describe "with valid params" do
      it "should return an auth_token" do
        user = create(:user, password: "12345678")
        post :create, username: user.email, password: "12345678"

        response.status.should == 201
        JSON.parse(response.body)["auth_token"].should == AuthToken.last.token
      end

    end

    describe "with invalid params" do
    end

  end

  describe "DELETE destroy" do

  end

end
