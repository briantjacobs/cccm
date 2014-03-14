class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :grantmaker_group 
      t.string :grantmaker_name
      t.string :grantmaker_state
    end

	add_index :donors, :grantmaker_group, :unique => true
    
  end
end
