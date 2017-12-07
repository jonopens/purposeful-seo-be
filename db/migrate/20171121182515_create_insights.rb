class CreateInsights < ActiveRecord::Migration[5.1]
  def change
    create_table :insights do |t|
  		t.integer :crawl_id
  		t.integer :page_id
    	t.string :optimization_type
    	t.string :content
    	t.string :completion_status
    end
  end
end
