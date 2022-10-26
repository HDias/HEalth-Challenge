require 'rails_helper'

RSpec.describe Municipe, type: :model do
  describe '#name' do
    specify { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:name) }
  end

  describe '#cpf' do
    specify { is_expected.to have_db_column(:cpf).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cpf) }
    specify { is_expected.to require_a_valid_cpf(:cpf) }
  end

  describe '#cns' do
    specify { is_expected.to have_db_column(:cns).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cns) }

    context 'when the cns value is less than 15' do
      it 'record is not valid and adds greater_than_or_equal_to error to cns attribute' do
        municipe = build(:municipe, cns: '123')

        expect(municipe.valid?).to be false
        expect(municipe.errors[:cns]).not_to be_empty
      end
    end
  end

  describe '#email' do
    specify { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:email) }
    specify { is_expected.to validate_confirmation_of(:email) }

    specify { is_expected.to validate_email_format_of(:email).with_message('email inválido') }
  end

  describe '#birth_date' do
    specify { is_expected.to have_db_column(:birth_date).of_type(:date).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:birth_date) }
  end

  describe '#phone' do
    specify { is_expected.to have_db_column(:phone).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:birth_date) }
  end
end
