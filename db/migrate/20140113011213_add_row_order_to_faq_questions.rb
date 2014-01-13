class AddRowOrderToFaqQuestions < ActiveRecord::Migration
  def change
    add_column :faq_questions, :row_order, :integer

    execute "UPDATE faq_questions SET row_order = id"
  end
end
