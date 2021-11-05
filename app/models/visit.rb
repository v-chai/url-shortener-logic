class Visit < ApplicationRecord
    validates :visitor_id, :short_url_id, :visited_short_url, presence: true

    belongs_to :visitor,
        primary_key: :id,
        foreign_key: :visitor_id,
        class_name: 'User'

    belongs_to :visited_url,
        primary_key: :id,
        foreign_key: :short_url_id,
        class_name: 'ShortenedUrl'

    def self.record_visit!(user, shortened_url)
        Visit.create!(visitor_id: user.id, visited_short_url: shortened_url.short_url, short_url_id: shortened_url.id)
    end
end