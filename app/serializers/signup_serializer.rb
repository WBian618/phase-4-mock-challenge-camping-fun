class SignupSerializer < ActiveModel::Serializer
  belongs_to :camper
  belongs_to :activity
  attributes :id, :camper_id, :activity_id, :time
end
