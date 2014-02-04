class Donation < ActiveRecord::Base

  def confirm!(transaction_id)
    update_attributes(confirmed: true,
                      payment_id: transaction_id)
  end
end
