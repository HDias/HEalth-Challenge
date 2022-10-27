require 'rails_helper'

RSpec.describe Endereco, type: :model do
  context 'associations' do
    describe '#municipe' do
      specify { is_expected.to belong_to(:municipe).inverse_of(:endereco) }
    end
  end

  describe '#cep' do
    specify { is_expected.to have_db_column(:cep).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cep) }
  end

  describe '#logradouro' do
    specify { is_expected.to have_db_column(:logradouro).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:logradouro) }
  end

  describe '#complemento' do
    specify { is_expected.to have_db_column(:complemento).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:complemento) }
  end

  describe '#bairro' do
    specify { is_expected.to have_db_column(:bairro).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:bairro) }
  end

  describe '#cidade' do
    specify { is_expected.to have_db_column(:cidade).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cidade) }
  end

  describe '#uf' do
    specify { is_expected.to have_db_column(:uf).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:uf) }
  end

  describe '#ibge_code' do
    specify { is_expected.to have_db_column(:ibge_code).of_type(:string).with_options(null: true) }
    specify { is_expected.to_not validate_presence_of(:ibge_code) }
  end
end
