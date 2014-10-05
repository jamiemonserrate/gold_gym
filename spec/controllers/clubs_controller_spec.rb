require 'rails_helper'

describe ClubsController, :type => :controller do
  let(:valid_attributes) {
    {name: 'Club name', workout_attributes: {title: 'workout title'}}
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  describe "GET show" do
    it "assigns the requested club as @club" do
      club = Club.create! valid_attributes
      get :show, {:id => club.to_param}
      expect(assigns(:club)).to eq(club)
    end
  end

  describe "GET new" do
    it "assigns a new club as @club" do
      get :new, {}
      expect(assigns(:club)).to be_a_new(Club)
    end
  end

  describe "GET edit" do
    it "assigns the requested club as @club" do
      club = Club.create! valid_attributes
      get :edit, {:id => club.to_param}
      expect(assigns(:club)).to eq(club)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Club" do
        expect {
          post :create, {:club => valid_attributes}
        }.to change(Club, :count).by(1)

        club = Club.last

        expect(club.name).to eq(valid_attributes[:name])
        expect(club.workout.title).to eq(valid_attributes[:workout_attributes][:title])
      end

      it "assigns a newly created club as @club" do
        post :create, {:club => valid_attributes}
        expect(assigns(:club)).to be_a(Club)
        expect(assigns(:club)).to be_persisted
      end

      it "redirects to the created club" do
        post :create, {:club => valid_attributes}
        expect(response).to redirect_to(Club.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved club as @club" do
        post :create, {:club => invalid_attributes}
        expect(assigns(:club)).to be_a_new(Club)
      end

      it "re-renders the 'new' template" do
        post :create, {:club => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {name: 'Club name updated', workout_attributes: {title: 'workout title updated'}}
      }

      it "updates the requested club" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => new_attributes}
        club.reload

        expect(club.name).to eq('Club name updated')
        expect(club.workout.title).to eq('workout title updated')
      end

      it "assigns the requested club as @club" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => valid_attributes}
        expect(assigns(:club)).to eq(club)
      end

      it "redirects to the club" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => valid_attributes}
        expect(response).to redirect_to(club)
      end
    end

    describe "with invalid params" do
      it "assigns the club as @club" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => invalid_attributes}
        expect(assigns(:club)).to eq(club)
      end

      it "re-renders the 'edit' template" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end
end
