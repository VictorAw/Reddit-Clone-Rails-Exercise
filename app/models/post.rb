# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text             not null
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :content, :sub_id, :author_id, presence: true

  belongs_to :sub

  # Inverse of is used for validation of existence of Post objects when PostSub is created
  # It works because PostSub looks inside the Post that it's given and then looks for
  # an association to itself, indicated by the "inverse_of" keyword.
  has_many :post_subs, inverse_of: :post

  has_many :subs,
  through: :post_subs,
  source: :sub
  has_many :comments

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author_id
end
