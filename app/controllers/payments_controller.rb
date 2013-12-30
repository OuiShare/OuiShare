class PaymentsController < InheritedResources::Base
  def success_callback
    if donation = Donation.where(payment_token: params[:token]).first
      payment = Payment.new
      payment.token = params[:token]
      payment.payer_id = params[:PayerID]
      payment.amount = donation.value
      payment.currency = donation.currency
      payment.complete!

      donation.confirm!(payment.identifier)
      redirect_to root_path, notice: t("payment.success")
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def cancel_callback
    redirect_to donations_url, alert: t("payment.error")
  end
end
