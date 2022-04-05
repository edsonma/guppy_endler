# frozen_string_literal: true

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
end
