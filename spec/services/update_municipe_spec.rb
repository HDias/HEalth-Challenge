require 'rails_helper'

RSpec.describe UpdateMunicipe do
  describe '.submit' do
    context 'with valid parameters' do
      it 'update Municipe name and send mail' do
        params = attributes_for(:municipe).except(:endereco).merge(endereco_attributes: attributes_for(:endereco).except(:municipe))
        municipe = Municipe.create!(params)

        new_name = 'New Name'
        params[:name] = new_name
        params[:endereco_attributes][:id] = municipe.endereco.id

        updater = described_class.new(params:, municipe:)

        expect do
          updater.submit
        end.to change(Municipe, :count).by(0)
           .and change(Endereco, :count).by(0)
           .and have_enqueued_job(ActionMailer::MailDeliveryJob)

        expect(municipe.reload.name).to eq(new_name)
      end
    end

    context 'when try update Municipe name to nil' do
      it 'does not update Municipe name' do
        params = attributes_for(:municipe).except(:endereco)
                                          .merge(endereco_attributes: attributes_for(:endereco)
                                          .except(:municipe))
        municipe = Municipe.create!(params)

        new_name = nil
        params[:name] = new_name
        params[:endereco_attributes][:id] = municipe.endereco.id

        updater = described_class.new(params:, municipe:)

        expect do
          updater.submit
        end.to change(Municipe, :count).by(0)
           .and change(Endereco, :count).by(0)
      end

      it 'does not send mail' do
        params = attributes_for(:municipe).except(:endereco)
                                          .merge(endereco_attributes: attributes_for(:endereco).except(:municipe))
        municipe = Municipe.create!(params)

        new_name = nil
        params[:name] = new_name
        params[:endereco_attributes][:id] = municipe.endereco.id

        updater = described_class.new(params:, municipe:)
        expect do
          updater.submit
        end.to_not have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end

    context 'when try update Endereco cep to nil' do
      it 'does not update Endereco cep' do
        params = attributes_for(:municipe).except(:endereco)
                                          .merge(endereco_attributes: attributes_for(:endereco)
                                          .except(:municipe))
        municipe = Municipe.create!(params)

        new_cep = nil
        params[:endereco_attributes][:cep] = new_cep
        params[:endereco_attributes][:id] = municipe.endereco.id

        updater = described_class.new(params:, municipe:)

        expect do
          updater.submit
        end.to change(Municipe, :count).by(0)
           .and change(Endereco, :count).by(0)

        expect(municipe.endereco.reload.cep).not_to eq(new_cep)
      end

      it 'does not send mail' do
        params = attributes_for(:municipe).except(:endereco).merge(endereco_attributes: attributes_for(:endereco).except(:municipe))
        municipe = Municipe.create!(params)

        new_cep = nil
        params[:endereco_attributes][:cep] = new_cep
        params[:endereco_attributes][:id] = municipe.endereco.id

        updater = described_class.new(params:, municipe:)
        expect do
          updater.submit
        end.to_not have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end
  end
end
