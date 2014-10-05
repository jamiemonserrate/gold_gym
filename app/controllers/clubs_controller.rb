class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update]

  def show
  end

  def new
    @club = Club.new
  end

  def edit
  end

  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :address, workout_attributes: [:title, :id])
  end
end
