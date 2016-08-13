class Contact < ApplicationRecord
  validates :session, presence: true,
                      length: { minimum: 10 }
  validates :email, presence: true
end
