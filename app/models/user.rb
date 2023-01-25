
  class User < ApplicationRecord
   has_many :blogs,dependent: :destroy

    has_secure_password
    validates :email, presence: true, uniqueness: true
  #  validates :number, presence: true, uniqueness: true
    
  end
