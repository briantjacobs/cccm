class GrantsController < ApplicationController



  def index
    require 'json'

    @grants = Grant.all

    @grants_grouped = Grant.select("grantmaker_group, grantmaker_name, recipient_name, SUM(grant_amount) as amount")
                          .group("grantmaker_group, recipient_name")
                          .order("amount")

    @grants_nodes = Grant.select("grantmaker_group").group("grantmaker_group")

    @grants_nodes.each

    # for each record
        # if the record doesnt exist, make an id for it, if not, fetch it
        #

        # create a table from the recipients with name and id
        # create a table from the donors with name and id
        # create a table of relations from id to id with year columns of contributions

  end
end