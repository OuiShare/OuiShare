module Admin
  class FaqQuestionsController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_faq_questions_path }
    end

    def update
      update! { admin_faq_questions_path }
    end

    def destroy
      destroy! { admin_faq_questions_path }
    end

    def show
      @faq_question = FaqQuestion.find(params[:id])
      render 'admin/faq_question/show'
    end

    def sort
      resource.update_attribute :row_order_position, params[:faq_question][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(faq_question: [:question, :answer, :row_order_position, :language_id])
    end

  end
end
