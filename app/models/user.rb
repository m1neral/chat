class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:vkontakte]

  validates :uid, presence: true

  def self.from_vk(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
    end
  end
end
