class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.belongs_to :club_owner

      t.timestamps
    end
  end
end
