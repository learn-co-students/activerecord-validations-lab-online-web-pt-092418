class MyVal < ActiveModel::Validator
  def validate(po)
    #binding.pry
    if po.title != nil
      unless po.title.include?("Won't Believe") || po.title.include?("Secret") || po.title.include?("Top") || po.title.include?("Guess")
        po.errors[:title] << 'Needs to be clickbate-y'
      end
    end
  end
end
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates_with (MyVal)
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
end

