class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :email, type: String
  field :password_digest, type: String

  validates_uniqueness_of :email
end
