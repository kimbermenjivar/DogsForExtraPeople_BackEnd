class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :breed, null: false
      t.string :size, null: false
      t.string :fur, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
