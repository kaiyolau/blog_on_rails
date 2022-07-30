class Post < ApplicationRecord
  after_initialize :set_defaults
  before_save :capitalize_title


  validates :title, presence: true,  uniqueness: {scope: :body}
  validates :body, presence: true,  length: { minimum: 50}

  has_many :comments, dependent: :destroy

  belongs_to :user






  private
  def set_defaults
      self.created_at ||Date.current
  end

  def capitalize_title
      self.title.capitalize!
  end


end
