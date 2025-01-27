class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :event_categories
  has_many :categories, through: :event_categories
    validates :title, presence: true
    validates :date, presence: true
  end
  