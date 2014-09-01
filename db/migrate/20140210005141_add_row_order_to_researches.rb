class AddRowOrderToResearches < ActiveRecord::Migration
  def change
    add_column :researches, :row_order, :integer

    execute "UPDATE researches SET row_order = id"
  end
end
