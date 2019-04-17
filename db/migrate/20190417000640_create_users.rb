class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role_vp
      t.integer :gender_vp
      t.string :cc
      t.string :string
      t.string :name
      t.string :address
      t.string :email
      t.string :password_digest
      t.bigint :phone_number
      t.date :date_of_birth
      t.string :api_token

      t.timestamps
    end
  end
end
