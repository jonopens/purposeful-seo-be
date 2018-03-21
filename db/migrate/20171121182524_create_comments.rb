class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.integer :page_id
    	t.integer :user_id
    	t.string :message
      t.string :visibility
    	t.timestamps
    end
  end
end
