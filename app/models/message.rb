class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :text, presence: true, length: { minimum: 1 }

  def self.get_dialog(sender_id, receiver_id)
    where(sender_id: sender_id, receiver_id: receiver_id).or(where(sender_id: receiver_id, receiver_id: sender_id))
  end
end