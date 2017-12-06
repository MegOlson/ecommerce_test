class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :content, :string
      t.column :account_id, :integer
      t.column :product_id, :integer

      t.timestamps
    end
  end
end
