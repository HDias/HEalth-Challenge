class Municipe < ApplicationRecord
  enum status: { ativo: 'ativo', inativo: 'inativo' }, _default: 'ativo'

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb_40, resize_to_limit: [40, 40]
    attachable.variant :thumb_80, resize_to_limit: [80, 80]
  end

  has_one :endereco, inverse_of: :municipe
  accepts_nested_attributes_for :endereco

  validates :status, inclusion: { in: statuses.keys }

  validates :name,        presence: true, length: { maximum: 200 }
  validates :cpf,         presence: true, cpf: true, uniqueness: { case_sensitive: true }
  validates :cns,         presence: true, cns: true
  validates :phone,       presence: true, length: { maximum: 200 }

  validates :email, presence: true, confirmation: true, length: { maximum: 200 }
  validates :email, email_format: { message: 'email inválido' }
  validates :email_confirmation, presence: true, length: { maximum: 200 }

  validates :birth_date, comparison: { less_than_or_equal_to: Date.today }
end
