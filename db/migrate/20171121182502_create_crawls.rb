class CreateCrawls < ActiveRecord::Migration[5.1]
  def change
    create_table :crawls do |t|
    	t.integer :status_code
    	t.text :content
    	t.integer :page_id
    	t.timestamps
    end
  end
end
