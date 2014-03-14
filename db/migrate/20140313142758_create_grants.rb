class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.belongs_to :donors
      t.belongs_to :recipients
      t.integer :year_authorized
      t.float :grant_amount
      t.string :support_type
      t.string :description
    end
  end
end
