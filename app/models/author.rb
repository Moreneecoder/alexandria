class Author < ApplicationRecord
  validates :given_name, presence: true
  validates :family_name, presence: true

  has_many :books
  has_many :publishers
end
