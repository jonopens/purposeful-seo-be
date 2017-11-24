class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
    	t.integer :site_id
    	t.string :page_path
    	t.string :page_status
    	t.float :text_to_html_ratio
    	t.integer :word_count
        t.string :title
        t.string :meta_desc
    	t.string :h1, array: true
    	t.string :h2, array: true
        t.datetime :last_crawled
        t.timestamps
    end
  end
end
