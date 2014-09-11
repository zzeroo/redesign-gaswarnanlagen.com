require 'spec_helper'

RSpec.describe BdasController do
  let!(:bda){ FactoryGirl.create(:bda) }

  describe "POST #create" do
    before(:each) do
      controller.stub!(:admin_user).and_return(true)
    end

    it { should permit( :name, :description, :product_nr_prefix, attached_assets_attributes: [ :asset, :_destroy] ).
      for(:create) }
  end

  describe "PUT #update" do
  end

  describe "GET index" do
    it "assigns @bdas" do
      get :index
      expect(assigns(:bdas)).to eq([bda])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET index" do
    it "assigns @bdas" do
      get :index
      expect(assigns(:bdas)).to eq([bda])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
