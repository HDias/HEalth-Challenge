class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :cep,         null: false
      t.string :logradouro,  null: false
      t.string :complemento, null: true
      t.string :bairro,      null: false
      t.string :cidade,      null: false
      t.string :uf,          null: false
      t.string :ibge_code,   null: true

      t.belongs_to :municipe, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
