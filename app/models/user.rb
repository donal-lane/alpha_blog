class User < ActiveRecord::Base
  has_many :articles
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

  has_secure_password                                           
end
