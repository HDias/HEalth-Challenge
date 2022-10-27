class Endereco < ApplicationRecord
  validates :cep, presence: true
  validates :logradouro, presence: true
  validates :complemento, presence: true
  validates :bairro, presence: true
  validates :cidade, presence: true
  validates :uf, presence: true
end
