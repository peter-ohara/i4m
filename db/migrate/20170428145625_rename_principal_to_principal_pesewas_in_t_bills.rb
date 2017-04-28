class RenamePrincipalToPrincipalPesewasInTBills < ActiveRecord::Migration[5.0]
  def change
    rename_column :t_bills, :principal, :principal_pesewas
  end
end
