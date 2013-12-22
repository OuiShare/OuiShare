module Admin
  class ProjectsController < BaseController
    inherit_resources
    belongs_to :language
    include AutoHtml

    def index
    end

    def create
      create! { admin_projects_path }
    end

    def update
      update! { admin_projects_path }
    end

    def destroy
      destroy! { admin_projects_path }
    end

    def show
      @project = Project.find(params[:id])
      @project.info = auto_html(@project.info) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
      @project.text1 = auto_html(@project.text1) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
      @project.text2 = auto_html(@project.text2) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }

      render 'admin/projects/show'
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
                              :featured])
    end

  end
end
