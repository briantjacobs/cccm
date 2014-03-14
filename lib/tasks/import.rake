namespace :import do

  desc "import grants"
  task :grants => :environment do 
    book = Spreadsheet.open "#{Rails.root.to_s}/db/initial/Countermovement Grants Final-1.xls"
    grants_sheet = book.worksheet 0

    Grant.delete_all
    Org.delete_all

    grants_sheet.each_with_index 1 do |row, i|
      org1 = Org.find_or_initialize_by(name: row[3]) 

      if !org1.persisted?
        # org1.group = row[2]
        org1.name = row[3]
        org1.state = row[4]
        org1.save
      end

      org2 = Org.find_or_initialize_by(name: row[5]) 
      if !org2.persisted?
        org2.name = row[5]
        org2.state = row[6]
        org2.city = row[7]
        org2.save
      end

      g = Grant.new
      g.year_authorized = row[8]
      g.grant_amount = row[9]
      g.support_type = row[10]
      g.description = row[11]
      g.donor_id = org1.id
      g.recipient_id = org2.id 
      g.save


    end

  end

end
