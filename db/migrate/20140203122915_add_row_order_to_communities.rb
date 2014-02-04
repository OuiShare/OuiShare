class AddRowOrderToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :row_order, :integer

    execute "UPDATE faq_questions SET row_order = id"
  end
end
