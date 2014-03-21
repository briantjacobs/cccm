class GrantsController < ApplicationController



  def index
    require 'json'

    # @grants = Grant.all

    # @grants_grouped = Grant.select("grantmaker_group, grantmaker_name, recipient_name, SUM(grant_amount) as amount")
    #                       .group("grantmaker_group, recipient_name")
    #                       .order("amount")

    # @grants_nodes = Grant.select("grantmaker_group").group("grantmaker_group")

    # @recipients = Recipient.select("*")

    # @donors = Donor.select("*")

    # @grants = Grant.select("*")

    # thing = Grant.includes(:donor, :recipient).first

    # @nodes = Grant.includes(posts: [{comments: :guest}, :tags]).find(1)

    # @nodes = Grant.joins(:orgs).where(year_authorized: 2005) #Org.all
    @nodes = Org.all
    # @nodes = Org.all.joins(:grants)
    # @nodes = Org.joins("INNER JOIN grants on donor_id = grants.id")
    @links = Grant.where(year_authorized: 2005)
# Author.joins(:posts).where(posts: {author: author})

    # @uniqDonors = Grant.uniq.pluck(:donor_id) - Grant.uniq.pluck(:recipient_id)
    
    # puts @uniqDonors.to_json

    # for each record
        # if the record doesnt exist, make an id for it, if not, fetch it
        #

        # create a table from the recipients with name and id
        # create a table from the donors with name and id
        # create a table of relations from id to id with year columns of contributions

  end
end