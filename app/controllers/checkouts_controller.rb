class CheckoutsController < ApplicationController
  before_action :get_total_price, :authenticate_user!

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def create
    result = Braintree::Transaction.sale(
      amount: @total_price,
      payment_method_nonce: params[:payment_method_nonce],
      options: {
        submit_for_settlement: true
      }
    )

    if result.success?
      @timeslot.update(booked: true, user_id: current_user.id)
      flash[:success] = "Your booking is successful!"
      redirect_to root_path
    else
      flash[:danger] = "Payment failed!"
      redirect_to root_path
    end

  end


  private

  def get_total_price
    @timeslot = Timeslot.find(params[:timeslot])
    @schedule = @timeslot.schedule
    @subject = @schedule.subject
    @total_price = @subject.hourly_rate

  end
end
