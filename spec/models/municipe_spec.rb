require 'rails_helper'

RSpec.describe Municipe, type: :model do
  describe '#name' do
    specify { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:name) }
  end

  describe '#cpf' do
    specify { is_expected.to have_db_column(:cpf).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cpf) }
  end

  describe '#cns' do
    specify { is_expected.to have_db_column(:cns).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cns) }
  end

  describe '#email' do
    specify { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:email) }
    specify { is_expected.to validate_confirmation_of(:email) }
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
