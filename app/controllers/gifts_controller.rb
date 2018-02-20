class GiftsController < ApplicationController
  before_action :authenticate_user!

  def new
    @gift = Gift.new
    @receiver = User.find params[:user_id]
  end

  def create
    @receiver = User.find params[:user_id]
    @gift = Gift.new(sender: current_user,
                     receiver: @receiver,
                     amount: params[:gift][:amount])
    if @gift.save
      redirect_to new_gift_payment_path(@gift), notice: 'Please complete payment'
    else
      flash.now[:alert] = 'Please fix errors below'
      render :new
    end
  end
end
