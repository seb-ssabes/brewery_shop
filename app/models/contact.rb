class Contact < ApplicationRecord
  validates :name, :email, :comment, presence: true
end
