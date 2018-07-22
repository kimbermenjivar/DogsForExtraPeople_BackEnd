class DogSerializer < ActiveModel::Serializer
  attributes :id, :breed, :size, :fur
  has_one :user
end
