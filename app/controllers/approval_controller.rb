class ApprovalController < ApplicationController
  def index
    @rewards = Reward.all
  end

end
