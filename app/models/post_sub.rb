class PostSub < ActiveRecord::Base
  # Validates :post means that on creation, is given a Post object instead of a post_id number
  # and then it looks for an association back to itself to validiate the connection
  validates :post, :sub_id, presence: true
  validates_associated :sub

  belongs_to :post
  belongs_to :sub
end
