class Company < ApplicationRecord
  has_many :involved_companies
  has_many :involved_companies, through: :involved_companies
  has_many :reviews, as: :reviewable
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
end
