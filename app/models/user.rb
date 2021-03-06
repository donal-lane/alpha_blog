class User < ActiveRecord::Base
  paginates_per 5
  has_many :articles, dependent: :destroy 
  # before an email is committed parse it to lowercase
  before_save { self.email = email.downcase }
  # Model valiations
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,    presence: true,
                       length:      { maximum: 105 },
                       uniqueness:  { case_sensitive: false },
                       format:      { with: VALID_EMAIL_REGEX }
  # enable salted password for users
  has_secure_password
end
