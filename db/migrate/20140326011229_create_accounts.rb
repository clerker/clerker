class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, id: false do |t|
      t.string :id, null: false
      t.string :secret, null: false
      t.string :name
      t.string :publishable_key
      t.string :access_token
      t.timestamps
    end
    
    reversible do |dir|
      dir.up{ execute "ALTER TABLE accounts ADD PRIMARY KEY (id);" }
    end
  end
end
