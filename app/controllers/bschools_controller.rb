class BschoolsController < ApplicationController

  def index    

      @bschools = Bschool.all.order(:name)
      @members = Member.all

  end    


  def show

    @bschool = Bschool.find_by(id: params["id"])
    @members = Member.all

 end

  def new
  	@bschool = Bschool.new 
      
  end

 
  def edit
    @bschool = Bschool.find(params[:id])
  end


  def create #this action does not need a view  
    
      @bschool = Bschool.new(params[:bschool])
      
      #check if able to save
      if @bschool.save #if returns 'true'
        redirect_to @bschool
      else
          render 'new' #show the form again
      end 
    end #end of create

  def update
    @bschool = Bschool.find(params[:id])
 
    if @member.update(params["bschool"])
      redirect_to @member
    else
      render 'edit'
    end
  end 

 
  def destroy
    @bschool = Bschool.find(params[:id])
    @bschool.delete
    redirect_to bschool_path
  end



end