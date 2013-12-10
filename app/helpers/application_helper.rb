module ApplicationHelper
  def admin?
    controller.class.name.split("::").first=="Admin"
  end
end
