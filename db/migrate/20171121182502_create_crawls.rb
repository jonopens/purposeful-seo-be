class CreateCrawls < ActiveRecord::Migration[5.1]
  def change
    create_table :crawls do |t|
    	t.integer :status_code
    	t.text :html_content
    	t.text :body_text
    	t.integer :page_id
    	t.timestamps
    end
  end
end
