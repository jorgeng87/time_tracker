require 'spec_helper'

describe TrackingsController do


  describe "GET index" do
  end

  describe "GET show" do
  end

  describe "POST create" do
    let(:valid_params) { { start: '2013-10-14 00:16', stop: '2013-10-14 1:18' } }
    describe "with valid params" do
    end

    describe "with invalid params" do
      it 'should require authentication' do
        post 'create', valid_params 
        binding.pry
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
    end

    describe "with invalid params" do
    end
  end

  describe "DELETE destroy" do
  end

end
