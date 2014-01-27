module Admin
  class RegionsController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_regions_path }
    end

    def update
      update! { admin_regions_path }
    end

    def destroy
      destroy! { admin_regionss_path }
    end

    def show
      @region = Region.find(params[:id])
      render 'admin/regions/show'
    end

    protected
    def permitted_params
      params.permit(region: [:title])
    end

  end
end
