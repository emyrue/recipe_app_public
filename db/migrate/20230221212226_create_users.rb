class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username

      #code is simply used to validate that the correct person is making an account. if the code is invalid, no other user should be able to make an account
      t.string :code

      t.timestamps
    end
  end
end
