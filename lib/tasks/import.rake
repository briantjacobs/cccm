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
      g.donors_id = d.id
      g.recipients_id = r.id 
      g.save



 #     n = Grant.new
  #     # puts row

  #     n.grantmaker_group = row[2]
  #     n.grantmaker_name = row[3]
  #     n.grantmaker_state = row[4]
  #     n.recipient_name = row[5]
  #     n.recipient_city = row[6]
  #     n.recipient_state = row[7]
  #     n.year_authorized = row[8]
  #     n.grant_amount = row[9]
  #     n.support_type = row[10]
  #     n.description = row[11]


      # p n
    end

  end

  # desc "import grants"
  # task :grants => :environment do 
  #   book = Spreadsheet.open "#{Rails.root.to_s}/db/initial/Countermovement Grants Final-1.xls"
  #   grants_sheet = book.worksheet 0

  #   grants_arr = []
  #   grantmaker_count = 0
  #   grants_sheet.each_with_index 1 do |row, i|
  #     # puts row

  #     n = Grant.new
  #     # puts row

  #     n.grantmaker_group = row[2]
  #     n.grantmaker_name = row[3]
  #     n.grantmaker_state = row[4]
  #     n.recipient_name = row[5]
  #     n.recipient_city = row[6]
  #     n.recipient_state = row[7]
  #     n.year_authorized = row[8]
  #     n.grant_amount = row[9]
  #     n.support_type = row[10]
  #     n.description = row[11]



  #     # n["grantmaker_group"] = row[2]
  #     # n["grantmaker_name"] = row[3]
  #     # n["grantmaker_state"] = row[4]
  #     # n["recipient_name"] = row[5]
  #     # n["recipient_city"] = row[6]
  #     # n["recipient_state"] = row[7]
  #     # n["year_authorized"] = row[8]
  #     # n["grant_amount"] = row[9]
  #     # n["support_type"] = row[10]
  #     # n["description"] = row[11]
      
  #     grants_arr << n
  #     # grantmaker_count =+ 1

  #   end


  #   puts grants_arr.length
  #   uniq = grants_arr.uniq {|p| p.grantmaker_group}
  #   uniq2 = grants_arr.uniq {|p| p.recipient_name}
  #   puts uniq.length
  #   puts uniq2.length

  # end


end
