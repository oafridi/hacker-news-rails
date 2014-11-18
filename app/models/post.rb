class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  before_save :format_title

  private
    def format_title
      self.title = self.title.titleize
    end
end
