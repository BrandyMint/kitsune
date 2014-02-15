class AddSelectorToSite < ActiveRecord::Migration
  def change
    add_column :sites, :selector, :string, :null=>false, :default=>''
  end
end
