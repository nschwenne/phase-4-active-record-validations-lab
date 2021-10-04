class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w( Fiction Non-Fiction ) }
    
    validate :title_needs_key_words

    def title_needs_key_words
        unless title.includes?("Wont Belive", "Secret", `Top [number]`, "Guess")
        errors.add(:title, "Needs more clickbait")    
        end
    end 
end
