class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.money :amount
      t.integer :sender_id
      t.integer :receiver_id
      t.string :stripe_txn_id

      t.timestamps
    end
  end
end
