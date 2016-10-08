class Comment < ActiveRecord::Base
  validates :content, :author_id, :post_id, presence: true

  belongs_to :author,
    class_name: User,
    primary_key: :id,
    foreign_key: :author_id

  belongs_to :post

  belongs_to :parent,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_id

  has_many :children,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_id
end
