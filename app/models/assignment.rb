class Assignment < ActiveRecord::Base
  validates :name, presence: true

  has_many :submissions
  belongs_to :user
  has_many :users, through: :submissions
  accepts_nested_attributes_for :user
  has_many :comments, as: :commentable
end
