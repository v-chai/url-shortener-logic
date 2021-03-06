class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :submitted_urls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'ShortenedUrl'

    has_many :visited_urls,
        -> { distinct },
        through: :visits,
        source: :visited_url
end