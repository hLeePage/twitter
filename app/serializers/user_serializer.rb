class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at
  has_many :tweets
end
