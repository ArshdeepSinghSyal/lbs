class User < ApplicationRecord
  before_save :default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :university
  has_many :reservations, dependent: :delete_all
  has_many :bookmarks, dependent: :delete_all

  validates :password, presence: true
  validates :usertype, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}

  def default_values
    if self.usertype == "librarian"
      self.is_approved ||= 0
    else
      self.is_approved ||= 1
    end
  end
end