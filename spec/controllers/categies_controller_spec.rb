require 'spec_helper'

RSpec.describe CategoriesController do
  let!(:category){ FactoryGirl.create(:category) }

  describe "POST #create" do
    before(:each) do
      controller.stub(:admin_user).and_return(true)
    end

    it { should permit( :name, :description, :published, :product_nr_prefix, :background_color, :logo, :parent_id, 
                       attached_assets_attributes: [:asset, :_destroy]).
                                                    for(:create) }
  end

  describe "PUT #update" do
  end

  describe "GET index" do
    it "assigns @categories" do
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET index" do
    it "assigns @categories" do
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
