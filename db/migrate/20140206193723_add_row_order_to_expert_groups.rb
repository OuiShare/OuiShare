class AddRowOrderToExpertGroups < ActiveRecord::Migration
  def change
    add_column :expert_groups, :row_order, :integer

    execute "UPDATE faq_questions SET row_order = id"
  end
end
