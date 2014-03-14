class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.belongs_to :grants
      t.string :recipient_name
      t.string :recipient_city
      t.string :recipient_state
    end    
	add_index :recipients, :recipient_name, :unique => true
    
  end
end
