class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    def is_clickbait?
        if title != nil && !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.include?("Top"))
            errors[:title] << "Title Must Be Clickbait!"
        end
    end
end
