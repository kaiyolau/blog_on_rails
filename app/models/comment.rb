class Comment < ApplicationRecord
  belongs_to :post


  validates  :body, length: {minimum: 3, maximum:200}



  private
  def set_defaults
      self.view_count ||= 0
  end
end
