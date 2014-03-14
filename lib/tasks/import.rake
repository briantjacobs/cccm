namespace :import do

  desc "import grants"
  task :grants => :environment do 
    book = Spreadsheet.open "#{Rails.root.to_s}/db/initial/Countermovement Grants Final-1.xls"
    grants_sheet = book.worksheet 0

    Grant.delete_all
    Donor.delete_all
    Recipient.delete_all
    grants_sheet.each_with_index 1 do |row, i|
      g = Grant.new
      d = Donor.find_or_initialize_by(grantmaker_group: row[2]) 
      r = Recipient.find_or_initialize_by(recipient_name: row[5])
      # puts row
      # puts Donor.find_by(grantmaker_group: row[2]).id.to_s

      d.grantmaker_group = row[2]
      d.grantmaker_name = row[3]
      d.grantmaker_state = row[4]
      d.save

      r.recipient_name = row[5]
      r.recipient_city = row[6]
      r.recipient_state = row[7]
      r.save  

      g.year_authorized = row[8]
      g.grant_amount = row[9]
      g.support_type = row[10]
      g.description = row[11]
      g.donor_id = d.id
      g.recipient_id = r.id 
      g.save
    end

  end

end
