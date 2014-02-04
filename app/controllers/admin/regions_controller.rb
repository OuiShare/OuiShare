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
      destroy! { admin_regions_path }
    end

    def show
      @region = Region.find(params[:id])
      render 'admin/regions/show'
    end

    def sort
      resource.update_attribute :row_order_position, params[:region][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(region: [:title, :row_order_position])
    end

  end
end
