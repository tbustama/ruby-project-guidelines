class CreateFavoriteTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_teams do |t|
      t.integer :user_id
      t.integer :team_id
    end
  end
end
