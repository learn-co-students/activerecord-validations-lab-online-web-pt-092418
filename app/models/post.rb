class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction)}
  validate :clickbait

  def clickbait
    if title.present? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess"))
      errors.add(:clickbait, "This is not clickbait.")
    end
  end

end
