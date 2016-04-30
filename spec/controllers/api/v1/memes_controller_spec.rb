require 'rails_helper'

RSpec.describe Api::V1::MemesController, :type => :controller do

  describe "GET index" do
    it "assigns all memes as @memes" do
      meme = create(:meme)
      second_meme = create(:meme)
      get :index
      expect(assigns(:memes)).to match_array([meme, second_meme])
    end

    it "renders all memes as JSON" do
      skip
    end
  end

  describe "GET show" do
    it "assigns the requested meme as @meme" do
      meme = create(:meme)
      get :show, id: meme
      expect(assigns(:meme)).to eq(meme)
    end

    it "renders the requested meme as JSON" do
      skip
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new meme in the database" do
        expect {
          post :create, meme: attributes_for(:meme)
        }.to change(Meme, :count).by(1)
      end

      it "assigns a newly created meme as @meme" do
        post :create, meme: attributes_for(:meme)
        expect(assigns(:meme)).to be_a(Meme)
        expect(assigns(:meme)).to be_persisted
      end

      it "renders the newly created meme as JSON" do
        post :create, meme: attributes_for(:meme)
        skip
      end
    end

    context "with invalid params" do
      it "does not create a new meme in the database" do
        expect {
          post :create, meme: attributes_for(:invalid_meme)
        }.to_not change(Meme, :count)
      end

      it "renders an empty hash as JSON" do
        post :create, meme: attributes_for(:invalid_meme)
        skip
      end
    end
  end

  describe "POST upvote" do
    it "assigns the requested meme as @meme" do
      meme = create(:meme)
      get :upvote, id: meme
      expect(assigns(:meme)).to eq(meme)
    end

    it "renders true as JSON" do
      skip
    end
  end

  describe "POST downvote" do
    it "assigns the requested meme as @meme" do
      meme = create(:meme)
      get :downvote, id: meme
      expect(assigns(:meme)).to eq(meme)
    end

    it "renders true as JSON" do
      skip
    end
  end
end
