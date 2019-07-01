class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_status
      t.integer :user_id
    end 
  end
end
