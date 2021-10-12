class Article < ApplicationRecord
    validates :title, :body, presence: true

    belongs_to :user
    has_and_belongs_to_many :categories
    has_many :comments

    scope :published, -> { where.not(published_at: nil) }
    scope :draft, -> { where(published_at: nil) }

    def long_title
        "#{title} - #{published_at}"
    end
end
