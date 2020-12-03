class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :nickname
<<<<<<< HEAD
      t.string :full_name
      t.string :location
      t.string :conference
      t.string :division
      t.string :venue
      t.integer :wins
      t.integer :losses
      t.integer :ties
      t.integer :division_rank
      t.text :rivals
    end
=======
>>>>>>> 73767303e0690d7f1409cfbc20dd44da24f0345e
  end
end
