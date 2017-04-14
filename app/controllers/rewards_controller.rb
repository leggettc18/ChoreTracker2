class RewardsController < ApplicationController
  
  before_filter :authenticate_parent!
  
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  # GET /rewards
  # GET /rewards.json
  def index
    @rewards = current_parent.rewards
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit
  end
    
  def pending
    
    pendingReward = Reward.find(params[:id])
    decrementChild = Child.find(params[:child])
    
    if decrementChild.balance > pendingReward.cost
      pendingReward.pending_approval = true
      pendingReward.save
   
      decrementChild.balance = decrementChild.balance - pendingReward.cost
      decrementChild.save
      
      redirect_to :back, notice: 'Reward is now waiting for parent approval'
    else
      redirect_to rewards_store_path, notice: 'NOT ENOUGH COINS!!!'
    end
  end
  
  def redeem
    redeemReward = Reward.find(params[:id])
    decrementChild = Child.find(params[:child])
    
    if decrementChild.balance > redeemReward.cost
      redeemReward.pending_approval = false
      redeemReward.redeemed = true
      redeemReward.save
    
      decrementChild.balance = decrementChild.balance - redeemReward.cost
      decrementChild.save
      
      redirect_to :back, notice: 'Reward was successfully redeemed.'
    else
      redirect_to :back, notice: 'Not enough coins bud!!!'
    end
    
  end
  
  def approve
    approvedReward = Reward.find(params[:id])
    approvedReward.pending_approval = false
    approvedReward.redeemed = true
    approvedReward.save
    
    redirect_to :back, notice: 'Reward was successfully approved.'
  end
  
  def deny
    deniedReward = Reward.find(params[:id])
    deniedReward.pending_approval = false;
    deniedReward.save
    
    incrementChild = Child.find(params[:child])
    incrementChild.balance += deniedReward.cost
    incrementChild.save
    
    redirect_to :back, notice: 'Reward was successfully denied.'
  end
  
  ####   resume normality ####
  
  
  
  
  

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1
  # PATCH/PUT /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def store
    @child_buyer = Child.find(getSubLoggedUser()[:id])
    @child = Child.find(getSubLoggedUser()[:id])
    @rewards = Reward.where(:child_id => @child.id)
  end
  
  def purchase
    @reward = Reward.find(params[:id])
    @child = Child.find(getSubLoggedUser()[:id])
    if @child.balance >= @reward.cost
      @reward.child_id = @child.id
      @child.balance -= @reward.cost
      @oldreward = @reward.dup
      @oldreward.save
    else
      errors.add(:cost, "You don't have enough coins to purchase this reward")
    end
    redirect_to(rewards_store_path)
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to rewards_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_params
      params.fetch(:reward, {}).permit(:cost, :name, :child_id, :parent_id, :auto_approve)
    end
end
