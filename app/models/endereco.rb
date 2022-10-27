class Endereco < ApplicationRecord
  belongs_to :municipe, inverse_of: :endereco

  validates :cep,         presence: true, length: { maximum: 200 }
  validates :logradouro,  presence: true, length: { maximum: 200 }
  validates :complemento, presence: true, length: { maximum: 200 }
  validates :bairro,      presence: true, length: { maximum: 200 }
  validates :cidade,      presence: true, length: { maximum: 200 }
  validates :uf,          presence: true, length: { maximum: 200 }

  validates :ibge_code, length: { maximum: 200 }

  def full_address
    "#{logradouro}, #{complemento}, #{bairro}, CEP: #{cep}"
  end
end
