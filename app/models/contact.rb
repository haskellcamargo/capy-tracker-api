class Contact < ApplicationRecord
  has_many :pages, dependent: :destroy

  validates :session, presence: true,
                      length: { minimum: 10 }
  validates :email, presence: true
end
