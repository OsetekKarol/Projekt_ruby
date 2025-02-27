class User < ApplicationRecord
  has_and_belongs_to_many :events

  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  