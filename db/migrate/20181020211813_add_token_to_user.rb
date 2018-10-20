class AddTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :toke, :string
    add_index :users, :toke, unique:true
  end
end
