class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.belongs_to :club

      t.timestamps
    end
  end
end
