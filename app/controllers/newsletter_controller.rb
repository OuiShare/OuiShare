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
      gb.lists.subscribe({:id => params[:newsletter][:language], email: {email: params[:newsletter][:email]}})
    rescue Gibbon::MailChimpError => e
      redirect_to newsletter_path, notice: e.message
      return
    end
    redirect_to root_path
  end
end
