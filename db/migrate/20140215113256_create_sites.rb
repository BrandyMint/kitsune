class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.references :user, index: true
      t.references :language, index: true

      t.timestamps
    end
  end
end
