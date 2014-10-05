class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
    @member.build_workout
  end

  def edit
    @member.build_workout if @member.workout.nil?
  end

  def create
    @member = Member.new(member_params)
    @member.workout.destroy if params[:member][:workout_attributes][:title].blank?

    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if params[:member][:workout_attributes][:title].blank?
      params[:member].delete(:workout_attributes)
      @member.workout.destroy unless @member.workout.nil?
    end

    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:last_name, :first_name, :club_id, workout_attributes: [:title, :id])
  end
end
