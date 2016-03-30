class User < ActiveRecord::Base
  has_many :notes
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
