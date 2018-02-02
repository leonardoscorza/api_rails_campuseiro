class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
