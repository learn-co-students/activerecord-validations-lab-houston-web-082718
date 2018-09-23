class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	validate :is_clickbait

	def is_clickbait
		unless title.is_a?(String) &&
					 (title.include?("Won't Believe") ||
						title.include?("Secret") ||
						title.include?("Guess") ||
						/Top \d/.match(title))
			errors[:title] << 'Needs a clickbaity title'
		end
	end
end
