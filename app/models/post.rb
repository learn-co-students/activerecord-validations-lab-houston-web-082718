class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    # Calling #validate (that's "validate" without an "s") with the name of an instance method
    validate :clickbait?

    # If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", 
    # the validator should return false
    def clickbait?
        if title != nil
            if !(title.include?("Won't Believe") || title.include?("Secret") || (title.include?("Top") && !title[/\d/].nil?) || title.include?("Guess"))
                errors.add(:title, "Title is NOT sufficiently clickbait-y")
            end
        end
    end
end