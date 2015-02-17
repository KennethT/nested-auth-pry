class User < ActiveRecord::Base
  # this gives us additional method such as
  # ".authenticate(password)", which salts and hashes the password; and compares it with the password_digest field
  # - *.password = : takes a plain text password, salts and hashes it, and
  # stores it in the database
  has_secure_password
  # make sure that each user has a non-blank and unique email
  validates :email, presence: true, uniqueness: true
end
