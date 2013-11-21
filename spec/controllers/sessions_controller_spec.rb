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

      it "should return a HTTP 401 code if the user doesn't exist" do
        post :create, username: "tooth.fairy@example.com", password: "abcd"

        response.status.should == 401 # Unauthorized
      end

      it "should return a HTTP 401 code if the password is wrong" do
        user = create(:user, password: "12345678")
        post :create, username: user.email, password: "abcd"

        response.status.should == 401 # Unauthorized
      end
    end

  end

  describe "DELETE destroy" do

  end

end
