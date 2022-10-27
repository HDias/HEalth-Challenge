class AddStatusToMunicipe < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE TYPE municipe_status AS ENUM ('ativo', 'inativo');
    SQL

    add_column :municipes, :status, :municipe_status, null: false
  end

  def down
    remove_column :municipes, :status

    execute <<-SQL
      DROP TYPE municipe_status;
    SQL
  end
end
