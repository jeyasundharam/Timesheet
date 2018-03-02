class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.decimal :hours, precision: 4,scale: 2
      t.date :taskdate
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
