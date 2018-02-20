class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @gift = Gift.find params[:gift_id]
  end

  def create
    @gift = Gift.find params[:gift_id]
    begin
      charge = Stripe::Charge.create(
        amount: (@gift.amount * 100).to_i,
        currency: 'cad',
        source: params[:stripe_token],
        description: "Payment for Gift ID: #{@gift.id}"
      )
      @gift.update(stripe_txn_id: charge.id)
      redirect_to @gift.receiver, notice: 'Thanks for the Gift ððð'
    rescue => e
      flash.now[:alert] = e.message
      render :new
    end
  end
end
