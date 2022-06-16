class Api::V1::MembersController < ApplicationController
  def index
    @house = House.find_by_name(params[:house_name].capitalize)
    @members = Member.where(house: @house)
  end
end
