class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team
      t.string :team_name
      t.integer :score
      t.integer :opponent_score
      t.datetime :time_of_possession
      t.integer :first_downs
      t.integer :penalties
      t.integer :fumbles
      t.integer :fumbles_forced
      t.integer :passing_touchdowns
      t.integer :rushing_touchdowns
      t.integer :sacks
    end
  end
end
