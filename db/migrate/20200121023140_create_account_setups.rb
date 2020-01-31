class CreateAccountSetups < ActiveRecord::Migration[6.0]
  def change
    create_table :account_setups do |t|
      t.boolean :has_account_login
      t.timestamps
    end
  end
end
