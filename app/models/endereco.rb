class Endereco < ApplicationRecord
  belongs_to :municipe, inverse_of: :endereco

  validates :cep, presence: true
  validates :logradouro, presence: true
  validates :complemento, presence: true
  validates :bairro, presence: true
  validates :cidade, presence: true
  validates :uf, presence: true
end
