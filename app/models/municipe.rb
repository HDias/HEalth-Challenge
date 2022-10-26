class Municipe < ApplicationRecord
  validates :name,        presence: true
  validates :cpf,         presence: true
  validates :cns,         presence: true
  validates :email,       presence: true
  validates :birth_date,  presence: true
  validates :phone,       presence: true

  validates :email, email_format: { message: 'email inválido' }

  validates :email, confirmation: true
end