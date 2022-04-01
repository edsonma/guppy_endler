class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :username, type: String
  field :email, type: String
end
