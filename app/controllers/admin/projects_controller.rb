module Admin
  class ProjectsController < BaseController
    inherit_resources
    belongs_to :language
    include AutoHtml
    skip_before_filter :verify_editor, only: [:show, :index]

    def index
    end

    def create
      create! { admin_projects_path }
    end

    def update
      params[:project][:slug] = nil
      update! { admin_projects_path }
    end

    def destroy
      destroy! { admin_projects_path }
    end

    def show
      @project = Project.find(params[:id])

      if request.path != "/#{@current_language.slug}#{project_path(@project)}"
        redirect_to @project, status: :moved_permanently
        return
      end

      render 'admin/projects/show'
    end

    def sort
      resource.update_attribute :row_order_position, params[:project][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(project: [:name,
                              :resume,
                              :image,
                              :info,
                              :join_us_text,
                              :service1_image,
                              :service1_link,
                              :service1_title,
                              :service2_image,
                              :service2_link,
                              :service2_title,
                              :service3_image,
                              :service3_link,
                              :service3_title,
                              :title1,
                              :text1,
                              :title2,
                              :text2,
                              :tag_list,
                              :language_id,
                              :visible,
                              :featured,
                              :display_on_menu,
                              :slug,
                              :row_order_position,
                              :user_ids => []])
    end

  end
end
