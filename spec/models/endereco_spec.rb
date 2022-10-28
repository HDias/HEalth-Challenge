require 'rails_helper'

RSpec.describe Endereco, type: :model do
  context 'associations' do
    describe '#municipe' do
      specify { is_expected.to belong_to(:municipe).inverse_of(:endereco) }
      specify { is_expected.to have_db_column(:municipe_id).of_type(:integer).with_options(null: false) }
    end
  end

  describe '#cep' do
    specify { is_expected.to have_db_column(:cep).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cep) }
    specify { is_expected.to validate_length_of(:cep).is_at_most(200) }
  end

  describe '#logradouro' do
    specify { is_expected.to have_db_column(:logradouro).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:logradouro) }
    specify { is_expected.to validate_length_of(:logradouro).is_at_most(200) }
  end

  describe '#complemento' do
    specify { is_expected.to have_db_column(:complemento).of_type(:string).with_options(null: true) }
    specify { is_expected.to validate_length_of(:complemento).is_at_most(200) }
  end

  describe '#bairro' do
    specify { is_expected.to have_db_column(:bairro).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:bairro) }
    specify { is_expected.to validate_length_of(:bairro).is_at_most(200) }
  end

  describe '#cidade' do
    specify { is_expected.to have_db_column(:cidade).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:cidade) }
    specify { is_expected.to validate_length_of(:cidade).is_at_most(200) }
  end

  describe '#uf' do
    specify { is_expected.to have_db_column(:uf).of_type(:string).with_options(null: false) }
    specify { is_expected.to validate_presence_of(:uf) }
    specify { is_expected.to validate_length_of(:uf).is_at_most(200) }
  end

  describe '#ibge_code' do
    specify { is_expected.to have_db_column(:ibge_code).of_type(:string).with_options(null: true) }
    specify { is_expected.to_not validate_presence_of(:ibge_code) }
    specify { is_expected.to validate_length_of(:ibge_code).is_at_most(200) }
  end
end
