class ChoresController < ApplicationController
  before_filter :authenticate_parent!
  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  # GET /chores
  # GET /chores.json
  
  def index
   # @chores = Chore.all
     @chores = Chore.all.order("due_date ASC")
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
    @chore = Chore.find(params[:id])
  end

  # GET /chores/new
  def new
    @chore = Chore.new
  end

  # GET /chores/1/edit
  def edit
  end
  
  
  
    
  ####    STARTING TO FUCK SOME SHIT UP HERE  #####
  
  
  def complete
    completeChore = Chore.find(params[:id])
    completeChore.completed = true
    completeChore.save
 
    
    
    incrementChild = Child.find(params[:child])
    incrementChild.balance = incrementChild.balance + completeChore.coins
    incrementChild.save
    
       
    redirect_to :back, notice: 'Chore was successfully completed.'
    
  end
  
  
  ####   resume normality ####
  
  

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)
   # msg1 = ''
    
    
    # Grabbing control here if our new chore has repeat data
    if @chore.repeat_type != "No Repeat"
         @chores = Array.new
         @modDue = @chore.due_date
         @i = 0
         
         #this conditional checks if we even have records to be able to grab the next, if NOT, use id of 1
        if (Chore.all.length != 0)
            @nextid = Chore.maximum(:id).next
           else
             @nextid = 1
        end
         
         
         
         while(@modDue <= @chore.repeat_until)
          # msg1 = msg1 + "\n" + (@modDue + 1.days).to_s
          
          #creating new instances of each repeat tasks, using same information as default chore but updated dueDate with modDue
          @chores[@i] = Chore.new(child_id: @chore.child_id, coins: @chore.coins, name: @chore.name, description: @chore.description, parent_id: @chore.parent_id, needs_approval: @chore.needs_approval, repeat_type: @chore.repeat_type, repeat_data: @chore.repeat_data, due_date: @modDue, completed: @chore.completed, repeat_until: @chore.repeat_until, group_id: @nextid)
          
          if @chore.repeat_type == "Daily"
            @modDue = @modDue + 1.days
          elsif @chore.repeat_type == "Weekly"
            @modDue = @modDue + 1.week
          elsif @chore.repeat_type == "Monthly"
            @modDue = @modDue + 1.month
          end
            @i = @i + 1
          
         end
     
      respond_to do |format|
        if @chores.each(&:save)
          format.html { redirect_to @chore, notice: 'Chores were successfully created.' }
          format.json { render :show, status: :created, location: @chore }
        else
          format.html { render :new }
          format.json { render json: @chore.errors, status: :unprocessable_entity }
        end
      end
      
    else
    
    
    #Run this if single chore, repeat_type == "No Repeat"

      respond_to do |format|
        if @chore.save
          format.html { redirect_to @chore, notice: 'Chore was successfully created.' }
          format.json { render :show, status: :created, location: @chore }
        else
          format.html { render :new }
          format.json { render json: @chore.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to chores_url, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.fetch(:chore, {}).permit(:name, :description, :coins, :child_id, :due_date, :repeat_type, :repeat_data, :parent_id, :needs_approval, :repeat_until, :group_id)
    end
end
