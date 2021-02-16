class PlansController < ApplicationController
  # before_action :set_plan, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:create, :index]

  def index
    @plans = Plan.all

    render json: @plans, include: [:user]
  end

  def show
    render json: @plan
  end

  def create
    @plan = Plan.create(plan_params)

    render json: @plan, status: :created
  end

  def update
    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @plan = Plan.find(params[:id])

    @plan.destroy
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:name, :date, :location, :time, :description, :user_id)
    end

end
