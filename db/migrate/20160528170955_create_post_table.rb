class CreatePostTable < ActiveRecord::Migration
  def change
  		create_table :posts do |item|
  			item.string :text
  			item.string :subject
  			item.integer :user_id
  		end
  end
end
