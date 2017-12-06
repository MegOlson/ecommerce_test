class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.column :user_id, :integer
      
      t.timestamps
    end
  end
end
