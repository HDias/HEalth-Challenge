require 'rails_helper'

RSpec.describe Municipe, type: :model do
  context 'associations' do
    specify { is_expected.to have_one_attached(:avatar) }
    specify { is_expected.to have_one(:endereco).inverse_of(:municipe).required }
  end

  describe '#status' do
    specify { is_expected.to have_db_column(:status).of_type(:enum) }
    specify do
      is_expected.to define_enum_for(:status).with_values(
        ativo: 'ativo',
        inativo: 'inativo'
      ).backed_by_column_of_type(:enum)
    end
    specify { is_expected.to allow_values(:ativo, :inativo).for(:status) }
  end


  describe '#name' do
    specify { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:name) }
    specify { is_expected.to validate_length_of(:name).is_at_most(200) }
  end

  describe '#cpf' do
    specify { is_expected.to have_db_column(:cpf).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cpf) }
    specify { is_expected.to require_a_valid_cpf(:cpf) }
    specify { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
  end

  describe '#cns' do
    specify { is_expected.to have_db_column(:cns).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_cns }
  end

  describe '#email' do
    specify { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:email) }
    specify { is_expected.to validate_confirmation_of(:email) }
    specify { is_expected.to validate_email_format_of(:email).with_message('email inválido') }
    specify { is_expected.to validate_length_of(:email).is_at_most(200) }

    specify { is_expected.to validate_presence_of(:email_confirmation) }
    specify { is_expected.to validate_length_of(:email_confirmation).is_at_most(200) }
  end

  describe '#birth_date' do
    specify { is_expected.to have_db_column(:birth_date).of_type(:date).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:birth_date) }

    context 'when birth date is greater than the current day' do
      it 'record is not valid and adds greater_than_or_equal_to error to birth_date attribute' do
        municipe = build(:municipe, birth_date: Date.tomorrow)

        expect(municipe.valid?).to be_falsey
        expect(municipe.errors[:birth_date]).not_to be_empty
      end
    end

    context 'when birth date is equals to current day' do
      it 'record is valid and not adds greater_than_or_equal_to error to birth_date attribute' do
        municipe = build(:municipe, birth_date: Date.today)

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:birth_date]).to be_empty
      end
    end

    context 'when birth date is less than the current day' do
      it 'record is valid and not adds greater_than_or_equal_to error to birth_date attribute' do
        municipe = build(:municipe, birth_date: Date.yesterday)

        expect(municipe.valid?).to be_truthy
        expect(municipe.errors[:birth_date]).to be_empty
      end
    end
  end

  describe '#phone' do
    specify { is_expected.to have_db_column(:phone).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:birth_date) }
    specify { is_expected.to validate_length_of(:phone).is_at_most(200) }
  end
end
