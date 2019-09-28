class University < ApplicationRecord
  has_many :libraries, dependent: :delete_all
end
