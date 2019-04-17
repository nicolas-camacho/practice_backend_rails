class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.references :headquarter, foreign_key: true
      t.integer :brand_vp
      t.integer :code
      t.string :model

      t.timestamps
    end
  end
end
