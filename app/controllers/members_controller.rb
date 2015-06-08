class MembersController < ApplicationController

  def index      
      if params[:search]
        @members = Member.search(params[:search]).order(:first_name)
      else
        @members = Member.all.order(:first_name)
  end
  
  end    


  def show

      @member = Member.find_by(id: params["id"])

 end

  def new
  	@member = Member.new 
      
  end

 
  def edit
    @member = Member.find(params[:id])
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

  def update
    @member = Member.find(params[:id])
 
    if @member.update(params["member"])
      redirect_to @member
    else
      render 'edit'
    end
  end 

 
  def destroy
    @member = Member.find(params[:id])
    @member.delete
    redirect_to members_path
  end


  def import
    begin
      Member.import(params[:file])
      redirect_to root_url, notice: "Members imported."
    rescue
      redirect_to root_url, notice: "Invalid file format."
    end
  end

end