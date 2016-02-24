class User < ActiveRecord::Base
  has_secure_password
  has_many :snippets, dependent: :destroy
  
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
end
