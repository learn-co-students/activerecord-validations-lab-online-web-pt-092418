class MyValidator < ActiveModel::Validator
  def validate(post)
    puts "got here with #{post.title}"
    if !post.title
      return false
    elsif post.title.downcase.include? "won't believe"
      return true
    elsif post.title.downcase.include? "secret"
      return true
    elsif post.title.downcase.include? "top [number]"
      return true
    elsif post.title.downcase.include? "guess"
      return true 
    else 
      post.errors[:name] = "No clickbait"
    end
  end
end


class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250} 
  validates :category, :inclusion => { :in => ["Fiction", "Non-Fiction"] }
end
