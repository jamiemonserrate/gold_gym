class ClubOwnersController < ApplicationController

  def index
    @club_owners = ClubOwner.all
  end

  def show
    @club_owner = ClubOwner.find(params[:id])
  end

  def new
    @club_owner = ClubOwner.new
    @club_owner.build_club.build_workout
  end

  def create
    @club_owner = ClubOwner.new(club_owner_params)

    if @club_owner.save
      redirect_to @club_owner, notice: 'Club owner was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  def club_owner_params
    params.require(:club_owner).permit(:email, club_attributes: [:name, :address, workout_attributes: [:title, :id]])
  end
end
