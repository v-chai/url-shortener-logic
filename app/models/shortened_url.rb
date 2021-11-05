class ShortenedUrl < ApplicationRecord
    include SecureRandom

    validates :long_url, :short_url, :user_id, presence: true
    validates :short_url, uniqueness: true 

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User'
    

    def self.random_code
        code = nil
        until code && !ShortenedUrl.exists?(short_url: code)
            code = SecureRandom.urlsafe_base64(16)
        end
        code
    end

    def self.generate_short_url(user, long_url)
        self.create!(
            long_url: long_url, 
            short_url: self.random_code, 
            user_id: user.id)
    end
end