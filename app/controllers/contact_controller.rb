class ContactController < ApplicationController
  def index
  end

  def submit
    ContactMailer.contact(params).deliver!
    redirect_to root_path, notice: t('contact.success')
  end
end
