module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :email, :user_id

    def user_id
      object.id
    end
    
  end
end