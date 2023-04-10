class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_type, null: false, default: "user"
      t.string :username

      #code is simply used to validate that a user is making an admin account. If the code is invalid, the account will be a normal non-admin account

      t.string :code

      t.timestamps
    end
  end
end
