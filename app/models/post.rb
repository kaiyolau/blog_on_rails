class Post < ApplicationRecord

  validates :title, presence: true,  uniqueness: {scope: :body}
  validates :body, presence: true,  length: { minimum: 50}

  has_many :comments, dependent: :destroy








  private
  def set_defaults
      self.view_count ||= 0
  end

  def capitalize_title
      self.title.capitalize!
  end


end
