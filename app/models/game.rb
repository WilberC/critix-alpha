class ParentGameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.main_game?
      unless value.blank?
        record.errors[attribute] << (options[:message] || 'not required on main_games')
      end
    else
      if Game.find_by(id: value).nil?
        record.errors[attribute] << (options[:message] || 'game not valid')
      end
    end
  end
end

class Game < ApplicationRecord
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
  has_many :expansions, class_name: 'Game', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Game', optional: true
  has_many :reviews, as: :reviewable
  enum category: {main_game: 0, expansion: 1}
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :parent_id, parent_game: true
end
