module ApplicationHelper
  def admin?
    return false if params[:action] == 'show'
    controller.class.name.split("::").first=="Admin"
  end
end
