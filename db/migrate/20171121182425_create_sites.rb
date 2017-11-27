class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :full_url
      t.string :domain_name
      t.string :protocol
      t.integer :page_count
      t.integer :user_id
      t.timestamps
    end
  end
end
