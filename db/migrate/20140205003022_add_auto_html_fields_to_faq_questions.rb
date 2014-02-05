class AddAutoHtmlFieldsToFaqQuestions < ActiveRecord::Migration
  def change
    add_column :faq_questions, :question_html, :text
    add_column :faq_questions, :answer_html, :text
  end
end
