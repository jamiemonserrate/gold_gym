require 'rails_helper'

describe ClubOwnersController, :type => :controller do

  let(:valid_attributes) {
    {email: 'jamie@gmail.com', club_attributes: {name: 'Club name', workout_attributes: {title: 'workout title'}}}
  }

  let(:invalid_attributes) {
    {email: ''}
  }

  describe "GET index" do
    it "assigns all club_owners as @club_owners" do
      club_owner = ClubOwner.create! valid_attributes

      get :index, {}

      expect(assigns(:club_owners)).to eq([club_owner])
    end
  end

  describe "GET show" do
    it "assigns the requested club_owner as @club_owner" do
      club_owner = ClubOwner.create! valid_attributes

      get :show, {:id => club_owner.to_param}

      expect(assigns(:club_owner)).to eq(club_owner)
    end
  end

  describe "GET new" do
    it "assigns a new club_owner as @club_owner with new club and a new default workout" do
      get :new, {}

      club_owner = assigns(:club_owner)
      expect(club_owner).to be_a_new(ClubOwner)
      expect(club_owner.club).to be_a_new(Club)
      expect(club_owner.club.workout).to be_a_new(Workout)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ClubOwner with a club and a workout" do
        expect {
          post :create, {:club_owner => valid_attributes}
        }.to change(ClubOwner, :count).by(1)

        club_owner = ClubOwner.last

        expect(club_owner.email).to eq(valid_attributes[:email])
        expect(club_owner.club.name).to eq(valid_attributes[:club_attributes][:name])
        expect(club_owner.club.workout.title).to eq(valid_attributes[:club_attributes][:workout_attributes][:title])
      end

      it "assigns a newly created club_owner as @club_owner" do
        post :create, {:club_owner => valid_attributes}

        expect(assigns(:club_owner)).to be_a(ClubOwner)
        expect(assigns(:club_owner)).to be_persisted
      end

      it "redirects to the created club_owner" do
        post :create, {:club_owner => valid_attributes}

        expect(response).to redirect_to(ClubOwner.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved club_owner as @club_owner" do
        post :create, {:club_owner => invalid_attributes}

        expect(assigns(:club_owner)).to be_a_new(ClubOwner)
      end

      it "re-renders the 'new' template" do
        post :create, {:club_owner => invalid_attributes}

        expect(response).to render_template("new")
      end
    end
  end
end
