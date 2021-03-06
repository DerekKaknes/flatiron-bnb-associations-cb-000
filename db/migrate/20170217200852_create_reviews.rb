class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :guest, references: :users, index: true
      t.references :reservation, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users, column: :guest_id
    add_foreign_key :reviews, :reservations
  end
end
