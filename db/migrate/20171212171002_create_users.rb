class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      # Because we're going to search for users by their email,
      # we'll add an index for the column. At the same time, we'll
      # that emails must be unique on the database side.
      t.string :email, index: {unique: true}
      t.string :password_digest

      t.timestamps
    end
  end
end
