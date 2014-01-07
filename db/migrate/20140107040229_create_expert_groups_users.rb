class CreateExpertGroupsUsers < ActiveRecord::Migration
  def change
    create_table :expert_groups_users do |t|
      t.references :expert_group, index: true
      t.references :user, index: true
    end
  end
end
