class ContactController < ApplicationController
  def index
    @contact_page = @current_language.contact_page || ContactPage.new
  end

  def submit
    unless params[:contact][:email].present? && params[:contact][:name].present?
      redirect_to contact_path, alert: t('contact.missing_fields')
      return
    end
    countries = {'France' => 'macabitbol@gmail.com',
                'Germany' => 'dach@ouishare.net',
                'Austria' => 'dach@ouishare.net',
                'Switzerland' => 'dach@ouishare.net',
                'Spain' => 'spain@ouishare.net',
                'England' => 'gb@ouishare.net',
                'Scottland' => 'gb@ouishare.net',
                'Ireland' => 'gb@ouishare.net',
                'Brazil' => 'latam@ouishare.net',
                'Argentina' => 'latam@ouishare.net',
                'Chile' => 'latam@ouishare.net',
                'Bolivia' => 'latam@ouishare.net',
                'Colombia' => 'latam@ouishare.net',
                'Costa Rica' => 'latam@ouishare.net',
                'Cuba' => 'latam@ouishare.net',
                'Dominican Republic' => 'latam@ouishare.net',
                'Ecuador' => 'latam@ouishare.net',
                'El Salvador' => 'latam@ouishare.net',
                'Guatemala' => 'latam@ouishare.net',
                'Haiti' => 'latam@ouishare.net',
                'Honduras' => 'latam@ouishare.net',
                'Mexico' => 'latam@ouishare.net',
                'Nicaragua' => 'latam@ouishare.net',
                'Panama' => 'latam@ouishare.net',
                'Paraguay' => 'latam@ouishare.net',
                'Peru' => 'latam@ouishare.net',
                'Puerto Rico' => 'latam@ouishare.net',
                'Uruguay' => 'latam@ouishare.net',
                'Venezuela' => 'latam@ouishare.net',
                'Finnland' => 'scandinavia@ouishare.net',
                'Sweden' => 'scandinavia@ouishare.net',
                'Norway' => 'scandinavia@ouishare.net',
                'Denmark' => 'scandinavia@ouishare.net',
                'Poland' => 'polska@ouishare.net',
                'Hungary' => 'ceeurope@ouishare.net',
                'Romania' => 'ceeurope@ouishare.net',
                'Slovakia' => 'ceeurope@ouishare.net',
                'Czech Republic' => 'ceeurope@ouishare.net',
                'Bulgaria' => 'ceeurope@ouishare.net',
                'Slovenia' => 'ceeurope@ouishare.net',
                'Croatia' => 'ceeurope@ouishare.net',
                'Bosnia' => 'ceeurope@ouishare.net',
                'Ukraine' => 'ceeurope@ouishare.net',
                'Belarus' => 'ceeurope@ouishare.net',
                'Moldova, Republic of' => 'ceeurope@ouishare.net',
                'Estonia' => 'ceeurope@ouishare.net',
                'Lativa' => 'ceeurope@ouishare.net',
                'Lithuania' => 'ceeurope@ouishare.net',
                'Albania' => 'ceeurope@ouishare.net',
                'Bosnia-Herzogovina' => 'ceeurope@ouishare.net',
                'Kosovo' => 'ceeurope@ouishare.net',
                'Macedonia' => 'ceeurope@ouishare.net',
                'Montenegro' => 'ceeurope@ouishare.net',
                'Algeria' => 'arabcountries@ouishare.net',
                'Bahrain' => 'arabcountries@ouishare.net',
                'Comoros' => 'arabcountries@ouishare.net',
                'Egypt' => 'arabcountries@ouishare.net',
                'Djibouti' => 'arabcountries@ouishare.net',
                'Iraq' => 'arabcountries@ouishare.net',
                'Jordan' => 'arabcountries@ouishare.net',
                'Kuwait' => 'arabcountries@ouishare.net',
                'Lebanon' => 'arabcountries@ouishare.net',
                'Libya' => 'arabcountries@ouishare.net',
                'Morocco' => 'arabcountries@ouishare.net',
                'Palestine' => 'arabcountries@ouishare.net',
                'Saudi Arabia' => 'arabcountries@ouishare.net',
                'Mauritania' => 'arabcountries@ouishare.net',
                'Oman' => 'arabcountries@ouishare.net',
                'Somalia' => 'arabcountries@ouishare.net',
                'Sudan' => 'arabcountries@ouishare.net',
                'Syria' => 'arabcountries@ouishare.net',
                'Tunisia' => 'arabcountries@ouishare.net',
                'United Arab Emirates' => 'arabcountries@ouishare.net',
                'Yemen' => 'arabcountries@ouishare.net'}

    if countries.keys.include?(params[:contact][:country])
      params[:contact][:to] = countries[params[:contact][:country]]
    else
      params[:contact][:to] = 'macabitbol@gmail.com'
    end
    ContactMailer.contact(params).deliver!
    redirect_to root_path, notice: t('contact.success')
  end
end
