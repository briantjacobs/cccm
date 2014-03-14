class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.belongs_to :donor, :class_name=>"Org", :foreign_key=>"donor_id"
      t.belongs_to :recipient, :class_name=>"Org", :foreign_key=>"recipient_id"
      # t.belongs_to :recipient
      # t.belongs_to :org
      t.integer :year_authorized
      t.float :grant_amount
      t.string :support_type
      t.string :description
    end
  end
end
