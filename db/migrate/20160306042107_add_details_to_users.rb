class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :profile, :text
  end
end
