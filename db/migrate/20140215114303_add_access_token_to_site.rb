class AddAccessTokenToSite < ActiveRecord::Migration
  def change
    add_column :sites, :access_token, :string, :null=>false
    add_index :sites, :access_token
  end
end
