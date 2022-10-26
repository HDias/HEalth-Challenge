require 'rails_helper'

RSpec.describe "/municipes", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Municipe.create! valid_attributes
      get municipes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      municipe = Municipe.create! valid_attributes
      get municipe_url(municipe)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_municipe_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      municipe = Municipe.create! valid_attributes
      get edit_municipe_url(municipe)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Municipe" do
        expect {
          post municipes_url, params: { municipe: valid_attributes }
        }.to change(Municipe, :count).by(1)
      end

      it "redirects to the created municipe" do
        post municipes_url, params: { municipe: valid_attributes }
        expect(response).to redirect_to(municipe_url(Municipe.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Municipe" do
        expect {
          post municipes_url, params: { municipe: invalid_attributes }
        }.to change(Municipe, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post municipes_url, params: { municipe: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested municipe" do
        municipe = Municipe.create! valid_attributes
        patch municipe_url(municipe), params: { municipe: new_attributes }
        municipe.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the municipe" do
        municipe = Municipe.create! valid_attributes
        patch municipe_url(municipe), params: { municipe: new_attributes }
        municipe.reload
        expect(response).to redirect_to(municipe_url(municipe))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        municipe = Municipe.create! valid_attributes
        patch municipe_url(municipe), params: { municipe: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested municipe" do
      municipe = Municipe.create! valid_attributes
      expect {
        delete municipe_url(municipe)
      }.to change(Municipe, :count).by(-1)
    end

    it "redirects to the municipes list" do
      municipe = Municipe.create! valid_attributes
      delete municipe_url(municipe)
      expect(response).to redirect_to(municipes_url)
    end
  end
end
