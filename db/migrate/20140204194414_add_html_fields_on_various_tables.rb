class AddHtmlFieldsOnVariousTables < ActiveRecord::Migration
  def change
    add_column :what_is_sections, :text1_html, :text
    add_column :what_is_sections, :text2_html, :text
    add_column :what_is_sections, :text3_html, :text
    add_column :what_is_sections, :text4_html, :text

    add_column :hot_projects_sections, :text_html, :text

    add_column :events_sections, :text_html, :text

    add_column :articles_sections, :text_html, :text

    add_column :take_part_sections, :main_text_html, :text
    add_column :take_part_sections, :text1_html, :text
    add_column :take_part_sections, :text2_html, :text
    add_column :take_part_sections, :text3_html, :text

    add_column :missions, :text_html, :text

    add_column :activities, :text_html, :text

    add_column :timelines, :text_html, :text

    add_column :value_pages, :text_html, :text

    add_column :values, :text_html, :text

    add_column :collaborative_economy_pages, :text2_html, :text
    add_column :collaborative_economy_pages, :text3_html, :text
    add_column :collaborative_economy_pages, :text4_html, :text

    add_column :organization_pages, :main_text_html, :text
    add_column :organization_pages, :text1_html, :text
    add_column :organization_pages, :text2_html, :text
    add_column :organization_pages, :text3_html, :text
    add_column :organization_pages, :text4_html, :text

    add_column :team_pages, :text_html, :text

    add_column :advisors_pages, :text_html, :text

    add_column :community_pages, :main_text_html, :text

    add_column :communities, :text_html, :text

    add_column :expert_groups_pages, :main_text_html, :text

    add_column :expert_groups, :text_html, :text

    add_column :live_pages, :main_text_html, :text
    add_column :live_pages, :text1_html, :text
    add_column :live_pages, :text2_html, :text
    add_column :live_pages, :text3_html, :text
    add_column :live_pages, :text4_html, :text

    add_column :events, :resume_html, :text
    add_column :events, :info_html, :text
    add_column :events, :join_us_text_html, :text
    add_column :events, :text1_html, :text
    add_column :events, :text2_html, :text

    add_column :projects, :resume_html, :text
    add_column :projects, :info_html, :text
    add_column :projects, :join_us_text_html, :text
    add_column :projects, :text1_html, :text
    add_column :projects, :text2_html, :text

    add_column :knowledge_pages, :main_text_html, :text
    add_column :knowledge_pages, :text1_html, :text
    add_column :knowledge_pages, :text2_html, :text
    add_column :knowledge_pages, :text3_html, :text
    add_column :knowledge_pages, :text4_html, :text

    add_column :research_pages, :main_text_html, :text

    add_column :researches, :text_html, :text

    add_column :cocreation_pages, :text_html, :text

    add_column :cocreations, :text_html, :text

    add_column :donation_pages, :maintext_html, :text
    add_column :donation_pages, :thanks_text_html, :text
    add_column :donation_pages, :text1_html, :text
    add_column :donation_pages, :text2_html, :text

    add_column :get_involved_pages, :main_text_html, :text
    add_column :get_involved_pages, :text1_html, :text
    add_column :get_involved_pages, :text2_html, :text
    add_column :get_involved_pages, :text3_html, :text
    add_column :get_involved_pages, :text4_html, :text
    add_column :get_involved_pages, :text5_html, :text
    add_column :get_involved_pages, :text6_html, :text
    add_column :get_involved_pages, :text7_html, :text

    add_column :users, :bio_html, :text

    add_column :terms_pages, :text_html, :text

    add_column :press_room_pages, :main_text_html, :text
    add_column :press_room_pages, :text1_html, :text
    add_column :press_room_pages, :text2_html, :text
    add_column :press_room_pages, :text3_html, :text

    add_column :workus_pages, :text_html, :text

    add_column :services, :text_html, :text
  end
end
