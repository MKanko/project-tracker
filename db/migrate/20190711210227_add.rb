class Add < ActiveRecord::Migration
  def change
    add_column :projects, :total_cost, :decimal
    add_column :projects, :sub_cost, :decimal 
    add_column :projects, :subs, :string
    add_column :projects, :billing_status, :string
    add_column :projects, :description, :string 

  end
end
