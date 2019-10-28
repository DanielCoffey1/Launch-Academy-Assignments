class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    # binding.pry
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

  if @member.save
    flash[:notice] = "Member added successfully"
    redirect_to @house
  else
    flash[:alert] = "Member not created"
    render :new
  end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end
end
