class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait?

  def clickbait?
    if self.title && !self.title.match(/Won't Believe|Secret|Top [\d*]|Guess/)
      errors.add(:clickbait, "is not clickbaity enough")
    end
  end
end
