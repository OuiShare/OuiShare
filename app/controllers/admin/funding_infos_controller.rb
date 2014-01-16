module Admin
  class FundingInfosController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_funding_infos_path }
    end

    def update
      update! { admin_funding_infos_path }
    end

    def destroy
      destroy! { admin_funding_infos_path }
    end

    def show
      @funding_info = FundingInfo.find(params[:id])
    end

    protected
    def permitted_params
      params.permit(funding_info: [:title, :image, :text, :language_id])
    end

  end
end
