class User < ActiveRecord::Base
  has_one :profile
  has_many :posts 
  has_many :follows
  has_many :users, through: :follows
end

class Posts < ActiveRecord::Base
  belongs_to :user
end

class Profile < ActiveRecord::Base
  belongs_to :user
end

class Follow < ActiveRecord::Base
  belongs_to :user
end