class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.belongs_to :donor
      t.belongs_to :recipient
      t.integer :year_authorized
      t.float :grant_amount
      t.string :support_type
      t.string :description
    end
  end
end
