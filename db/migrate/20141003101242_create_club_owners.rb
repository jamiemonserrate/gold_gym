class CreateClubOwners < ActiveRecord::Migration
  def change
    create_table :club_owners do |t|
      t.string :email

      t.timestamps
    end
  end
end
