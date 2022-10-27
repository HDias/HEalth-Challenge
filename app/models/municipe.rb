class Municipe < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb_40, resize_to_limit: [40, 40]
    attachable.variant :thumb_80, resize_to_limit: [80, 80]
  end

  validates :name,        presence: true
  validates :cpf,         presence: true, cpf: true
  validates :cns,         presence: true, cns: true
  validates :phone,       presence: true

  validates :email,       presence: true
  validates :email, email_format: { message: 'email inválido' }

  validates :birth_date, presence: true
  validates :birth_date, comparison: { less_than_or_equal_to: Date.today }

  validates :email, confirmation: true
end
