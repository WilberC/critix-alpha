class OlderThanSixteenValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    now = Time.now.utc.to_date
    age = now.year - value.year - (now.month > value.month || (now.month == value.month && now.day >= value.day) ? 0 : 1)
    record.errors[attribute] << (options[:message] || 'You should be 16 years old to create an account') if age < 16
  end
end

class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  validates :username, :email, presence: true, uniqueness: true
  validates :birth_date, presence: true, older_than_sixteen: true
end
