class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver, :sender_id, :receiver_id, :text, :created_at

  def sender
    object.sender.name
  end

  def receiver
    object.receiver.name
  end
end
