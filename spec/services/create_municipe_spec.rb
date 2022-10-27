require 'rails_helper'

RSpec.describe CreateMunicipe do
  describe '.submit' do
    context 'with valid parameters' do
      it 'creates a new Municipe and Endereco and send mail' do
        params = attributes_for(:municipe).merge(endereco_attributes: attributes_for(:endereco))
        creator = described_class.new(params:)

        expect do
          creator.submit
        end.to change(Municipe, :count).by(1)
           .and change(Endereco, :count).by(1)
           .and have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end

    context 'when not add to params endereco attributes' do
      it 'does not create a new Municipe and Endereco' do
        params = attributes_for(:municipe)
        creator = described_class.new(params:)

        expect do
          creator.submit
        end.to change(Municipe, :count).by(0)
           .and change(Endereco, :count).by(0)
      end

      it 'does not send mail' do
        params = attributes_for(:municipe)
        creator = described_class.new(params:)

        expect do
          creator.submit
        end.to_not have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end
  end
end
