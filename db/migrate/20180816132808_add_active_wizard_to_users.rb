class AddActiveWizardToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active_wizard, :string
  end
end
