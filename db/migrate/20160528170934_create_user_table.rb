class CreateUserTable < ActiveRecord::Migration
  def change
  		create_table :users do |item|
  			item.string :username
  			item.string :password
  			item.string :fname
  			item.string :lname
  		end
  end
end
