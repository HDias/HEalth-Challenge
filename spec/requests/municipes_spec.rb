require 'rails_helper'

RSpec.describe MunicipesController, type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get municipes_url

      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_municipe_url

      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      municipe = create(:municipe)

      get edit_municipe_url(municipe)

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Municipe and Endereco' do
        expect do
          params = attributes_for(:municipe).merge(endereco_attributes: attributes_for(:endereco))

          post municipes_url, params: { municipe: params }
        end.to change(Municipe, :count).by(1)
           .and change(Endereco, :count).by(1)
      end

      it 'redirects to the created municipe' do
        params = attributes_for(:municipe).merge(endereco_attributes: attributes_for(:endereco))

        post municipes_url, params: { municipe: params }

        expect(response).to redirect_to(municipes_url)
      end
    end

    context 'when not add to params endereco attributes' do
      it 'does not create a new Municipe and Endereco' do
        params = attributes_for(:municipe)

        expect do
          post municipes_url, params: { municipe: params }
        end.to change(Municipe, :count).by(0)
           .and change(Endereco, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        params = attributes_for(:municipe)

        post municipes_url, params: { municipe: params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested municipe name' do
        params = attributes_for(:municipe).merge(endereco_attributes: attributes_for(:endereco))
        municipe = Municipe.create!(params)

        new_name = 'New Name'
        params[:name] = new_name
        params[:endereco_attributes][:id] = municipe.endereco.id

        patch municipe_url(municipe), params: { municipe: params }

        expect(municipe.reload.name).to eq(new_name)
      end

      it 'updates the requested endereco cep' do
        params = attributes_for(:municipe).merge(endereco_attributes: attributes_for(:endereco))
        municipe = Municipe.create!(params)

        new_cep = '77410500'
        params[:endereco_attributes][:cep] = new_cep
        params[:endereco_attributes][:id] = municipe.endereco.id

        patch municipe_url(municipe), params: { municipe: params }

        expect(municipe.reload.endereco.cep).to eq(new_cep)
      end

      it 'redirects to the municipe' do
        municipe = create(:municipe)

        params = attributes_for(:municipe)
        patch municipe_url(municipe), params: { municipe: params }

        expect(response).to redirect_to(municipe_url(municipe))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        municipe = create(:municipe)

        params = attributes_for(:municipe, name: nil)
        patch municipe_url(municipe), params: { municipe: params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
