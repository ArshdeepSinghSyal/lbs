class Book < ApplicationRecord
  # belongs_to :library

  validates :isbn, :presence => true, numericality: true, uniqueness: true
  validates :title, :presence => true
  validates :author, :presence => true
  validates :language, :presence => true
  validates :published, :presence => true
  validates :edition, :presence => true, numericality: true
  validates :image, :presence => true
  validates :subject, :presence => true
  # validates :summary
  validates :is_special_collection_item, :presence => true

  def self.search(search_params)
    if search_params[:title]
      book = Book.find_by(title: search_params[:title])
      if book
        self.where("title = ?",  search_params[:title])
      else
        Book.all
      end
    else
      Book.all
    end
  end
end
