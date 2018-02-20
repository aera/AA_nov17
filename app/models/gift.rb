class Gift < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id

  validates :amount, numericality: { greater_than_or_equal_to: 1,
                                     less_than: 10000
                                   }

  validate :cant_gift_self

  private

  def cant_gift_self
    if sender_id == receiver_id
      errors.add(:base, 'Receiver cannot be the same as sender')
    end
  end
end
