class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
<<<<<<< HEAD
      t.string :name
      t.integer :age
      t.string :city
      t.string :motto
=======
      t.string :username
      t.string :city
>>>>>>> 73767303e0690d7f1409cfbc20dd44da24f0345e
    end
  end
end
