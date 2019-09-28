class University < ApplicationRecord
  has_many :libraries, dependent: :delete_all
  has_many :users, dependent: :delete_all
end
