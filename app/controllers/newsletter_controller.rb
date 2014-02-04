class NewsletterController < ApplicationController
  def index
    @languages = NewsletterLanguage.all.map{ |n| [n.language, n.mailchimp_id] }
  end

  def subscribe
    if Rails.env.production?
      gb = Gibbon::API.new(ENV['mailchimp_key'])
    else
      gb = Gibbon::API.new('2429f1a83c7b9c1a0be20d595ff856cf-us3')
    end

    begin
      gb.lists.subscribe({:id => ENV['mailchimp_id'], email: {email: params[:email]}})
    rescue Gibbon::MailChimpError => e
      if e.code == 214
        redirect_to root_path, alert: t('newsletter.already_registered')
      else
        redirect_to root_path, alert: t('newsletter.error')
      end
      return
    end
    redirect_to root_path, notice: t('newsletter.successful')
  end
end
