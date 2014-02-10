module Admin
  class TestimonialsController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_testimonials_path }
    end

    def update
      update! { admin_testimonials_path }
    end

    def destroy
      destroy! { admin_testimonials_path }
    end

    protected
    def permitted_params
      params.permit(testimonial: [:user_picture1, :author1, :call_to_action1, :text1, :user_picture2, :author2, :call_to_action2, :text2, :user_picture3, :author3, :call_to_action3, :text3, :user_picture4, :author4, :call_to_action4, :text4])
    end

    def resource
      @testimonial ||= Testimonial.find(params[:id])
    end

    def build_resource
      @testimonial = Language.find(params[:language_id]).build_testimonial(permitted_params[:testimonial])
    end

  end
end
