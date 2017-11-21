class CreateKeyterms < ActiveRecord::Migration[5.1]
  def change
		create_table :keyterms do |t|
	  	t.integer :page_id
	  	t.string :phrase
	  	t.integer :est_search_vol
  	end
  end
end
