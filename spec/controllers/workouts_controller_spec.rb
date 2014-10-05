require 'rails_helper'

describe WorkoutsController, :type => :controller do

  let(:valid_attributes) {
    {title: 'Back Workout'}
  }

  let(:invalid_attributes) {
    {title: ''}
  }

  describe "GET show" do
    it "assigns the requested workout as @workout" do
      workout = Workout.create! valid_attributes
      get :show, {:id => workout.to_param}
      expect(assigns(:workout)).to eq(workout)
    end
  end

  describe "GET new" do
    it "assigns a new workout as @workout" do
      get :new, {}
      expect(assigns(:workout)).to be_a_new(Workout)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout as @workout" do
      workout = Workout.create! valid_attributes
      get :edit, {:id => workout.to_param}
      expect(assigns(:workout)).to eq(workout)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Workout" do
        expect {
          post :create, {:workout => valid_attributes}
        }.to change(Workout, :count).by(1)
      end

      it "assigns a newly created workout as @workout" do
        post :create, {:workout => valid_attributes}
        expect(assigns(:workout)).to be_a(Workout)
        expect(assigns(:workout)).to be_persisted
      end

      it "redirects to the created workout" do
        post :create, {:workout => valid_attributes}
        expect(response).to redirect_to(Workout.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workout as @workout" do
        post :create, {:workout => invalid_attributes}
        expect(assigns(:workout)).to be_a_new(Workout)
      end

      it "re-renders the 'new' template" do
        post :create, {:workout => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: 'Back Workout updated'}
      }

      it "updates the requested workout" do
        workout = Workout.create! valid_attributes
        put :update, {:id => workout.to_param, :workout => new_attributes}
        workout.reload
        expect(workout.title).to eq(new_attributes[:title])
      end

      it "assigns the requested workout as @workout" do
        workout = Workout.create! valid_attributes
        put :update, {:id => workout.to_param, :workout => valid_attributes}
        expect(assigns(:workout)).to eq(workout)
      end

      it "redirects to the workout" do
        workout = Workout.create! valid_attributes
        put :update, {:id => workout.to_param, :workout => valid_attributes}
        expect(response).to redirect_to(workout)
      end
    end

    describe "with invalid params" do
      it "assigns the workout as @workout" do
        workout = Workout.create! valid_attributes
        put :update, {:id => workout.to_param, :workout => invalid_attributes}
        expect(assigns(:workout)).to eq(workout)
      end

      it "re-renders the 'edit' template" do
        workout = Workout.create! valid_attributes
        put :update, {:id => workout.to_param, :workout => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end
end
