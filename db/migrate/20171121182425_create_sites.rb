class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :base_url
      t.integer :page_count
      t.integer :user_id
      t.timestamps
    end
  end
end
