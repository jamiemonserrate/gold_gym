class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.belongs_to :club
      t.belongs_to :workout

      t.timestamps
    end
  end
end
