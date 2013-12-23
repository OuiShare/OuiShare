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

    protected
    def permitted_params
      params.permit(faq_question: [:question, :answer, :language_id])
    end

  end
end
