class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :date
      t.string :location
      t.string :time
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
