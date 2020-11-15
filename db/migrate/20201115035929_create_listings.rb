class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :tutor_name
      t.string :tutor_email
      t.string :title
      t.text :description
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :programming_language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
