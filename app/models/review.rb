class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user, counter_cache: :review_count
end
