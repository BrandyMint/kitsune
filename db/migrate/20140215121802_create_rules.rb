class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :phrase
      t.string :link
      t.references :site, index: true

      t.timestamps
    end
  end
end
