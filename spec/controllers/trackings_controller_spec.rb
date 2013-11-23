require 'spec_helper'

describe TrackingsController do

  describe "GET index" do
  end

  describe "GET show" do
    describe "with valid params" do
      it "should show the tracking information" do
        user       = create(:user)
        auth_token = create(:auth_token, user: user)
        tracking   = create(:tracking, user: user)

        get 'show', { auth_token: auth_token.token, 
                      id:         tracking.id       } 
        response.status.should == 200
        response.body.should == tracking.to_json
      end

    end

    describe "with invalid params" do
      it "should return 404 if the tracking doesn't exist" do
        user       = create(:user)
        auth_token = create(:auth_token, user: user)

        get 'show', { auth_token: auth_token.token, 
                      id:         999      } 
        response.status.should == 404
      end

      it "shouldn't return any data if the tracking doesn't belong to the user" do
        user         = create(:user)
        auth_token   = create(:auth_token, user: user, token: "firstUserToken")
        another_user = create(:user)
        tracking     = create(:tracking, user: another_user)

        get 'show', { auth_token: auth_token.token,
                      id: tracking.id }
        response.status.should == 403 # Forbidden
      end
    end
  end

  describe "POST create" do
    let(:valid_params) { { start: '2013-10-14 00:16', stop: '2013-10-14 1:18',
                           description: "Working on Project A" } }

    describe "with valid params" do
      it "should create a tracking" do
        user       = create(:user)
        auth_token = create(:auth_token, user: user)

        expect { post 'create', { auth_token: auth_token.token, 
                                  tracking: valid_params } }.
          to change { Tracking.count }.from(0).to(1)
        response.status.should == 201 # Created
      end
    end

    describe "with invalid params" do
      it "should require authentication" do
        post 'create', tracking: valid_params 
        response.status.should == 401 # Unauthorized
      end

      it "shouldn't allow to set the user of the tracking" do
        user       = create(:user)
        auth_token = create(:auth_token, user: user)

        expect { post 'create', { auth_token: auth_token.token, 
                                  tracking: valid_params.merge({ user_id: user.id + 1 }) } }.
          to change { Tracking.count }.from(0).to(1)
        Tracking.last.user.should == user
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "should update a tracking" do
        user       = create(:user)
        auth_token = create(:auth_token, user: user)
        tracking   = create(:tracking, user: user)

        put 'update', { auth_token: auth_token.token,
                        id: tracking.id,
                        tracking: { description: "Working on project A designs" } }
        response.status.should == 204 # No content
      end
    end

    describe "with invalid params" do
      it "shouldn't be able to update a tracking from other users" do
        user         = create(:user)
        auth_token   = create(:auth_token, user: user, token: "firstUserToken")
        another_user = create(:user)
        tracking     = create(:tracking, user: another_user)

        put 'update', { auth_token: auth_token.token,
                        id: tracking.id,
                        tracking: { description: "Working on project A designs" } }
        response.status.should == 403 # Forbidden
      end
    end
  end

  describe "DELETE destroy" do
  end

end
