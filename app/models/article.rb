class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_many_attached :images do |image|
    image.variant :thumb, resize_to_fit: [ 50, 50 ]
    image.variant :sm, resize_to_fit: [ 100, 100 ]
    image.variant :md, resize_to_fit: [ 200, 200 ]
    image.variant :lg, resize_to_fit: [ 300, 300 ]
  end

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
