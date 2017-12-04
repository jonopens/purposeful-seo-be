class CreateInsights < ActiveRecord::Migration[5.1]
  def change
    create_table :insights do |t|
  		t.integer :crawl_id
    	t.string :type
    	t.string :message
    	t.string :completion_status
    end
  end
end
