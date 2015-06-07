class MembersController < ApplicationController

  def index
      @members = Member.all
      
  end

  def show
      @member = Member.find_by(id: params["id"])

      @emp_list = Employment.where(member_id: @member.id)
      @pre_MBA_employer = @emp_list.find_by(period_employed: "pre-MBA")
      @internship_MBA_employer = @emp_list.find_by(period_employed: "internship")
      @post_MBA_employer = @emp_list.find_by(period_employed: "post-MBA")

  end

  def new
  	@member = Member.new 

  end


  def create #this action does not need a view  
    
      @member = Member.new(params[:member])
      
      #check if able to save
      if @member.save #if returns 'true'
        redirect_to @member
      else
          render 'new' #show the form again
      end 
    end #end of create

  def import
    Member.import(params[:file])
    redirect_to root_url, notice: "Members imported."
  end



end