class ChoresController < ApplicationController
	before_action :find_chore, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_parent!, except: [:index]

	def index
		if parent_signed_in?
    		@chores = Chore.where(:parent_id => current_parent.id).order("created_at DESC")
    	end
	end

	def show
	end

	def new
		@chore = current_parent.chores.build
	end

	def create
		@chore = current_parent.chores.build(chore_params)

		if @chore.save
			redirect_to @chore
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @chore.update(chore_params)
			redirect_to @chore
		else
			render 'edit'
		end
	end

	def destroy
		@chore.destroy
		redirect_to root_path
	end

	def complete
		@chore = Chore.find(params[:id])
		@chore.update_attribute(:completed_at, Time.now)
		redirect_to @chore, notice: "Chore successfully completed!"
	end

	private
		def chore_params
			params.require(:chore).permit(:name, :description)
		end

		def find_chore
			@chore = Chore.find(params[:id])
		end
end















# class ChoresController < ApplicationController
#   before_filter :authenticate_parent!
#   before_action :set_chore, only: [:show, :edit, :update, :destroy]

#   # GET /chores
#   # GET /chores.json
#   def index
#     @chores = Chore.all
#   end

#   # GET /chores/1
#   # GET /chores/1.json
#   def show
#     @chore = Chore.find(params[:id])
#   end

#   # GET /chores/new
#   def new
#     @chore = Chore.new
#   end

#   # GET /chores/1/edit
#   def edit
#   end

#   # POST /chores
#   # POST /chores.json
#   def create
#     @chore = Chore.new(params.require(:chore).permit(:name, :description))
#     if @chore.save
#       redirect_to @chore
#     else
#       render 'new'
#     end
#     # @chore = Chore.new(chore_params)

#     # respond_to do |format|
#     #   if @chore.save
#     #     format.html { redirect_to @chore, notice: 'Chore was successfully created.' }
#     #     format.json { render :show, status: :created, location: @chore }
#     #   else
#     #     format.html { render :new }
#     #     format.json { render json: @chore.errors, status: :unprocessable_entity }
#     #   end
#     # end
#   end

#   # PATCH/PUT /chores/1
#   # PATCH/PUT /chores/1.json
#   def update
#     respond_to do |format|
#       if @chore.update(chore_params)
#         format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
#         format.json { render :show, status: :ok, location: @chore }
#       else
#         format.html { render :edit }
#         format.json { render json: @chore.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /chores/1
#   # DELETE /chores/1.json
#   def destroy
#     @chore.destroy
#     respond_to do |format|
#       format.html { redirect_to chores_url, notice: 'Chore was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_chore
#       @chore = Chore.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def chore_params
#       params.fetch(:chore, {}).permit(:name, :description, :coins, :child_id, :due_date, :repeat_type, :repeat_data, :parent_id, :needs_approval)
#     end
# end