class CreateFollowTable < ActiveRecord::Migration
  def change
  	create_table :follows do |item|
  		item.integer :follower_user_id
  		item.integer :followee_user_id
  	end
  end
end
