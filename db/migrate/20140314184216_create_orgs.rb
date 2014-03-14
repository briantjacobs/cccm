class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :group 
      t.string :name
      t.string :state
      t.string :city
    end

	add_index :orgs, :name, :unique => true
  end
end
