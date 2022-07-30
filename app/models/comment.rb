class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates  :body, length: {minimum: 3, maximum:200}



  private
  def set_defaults
      self.created_at ||Date.current
  end
end
