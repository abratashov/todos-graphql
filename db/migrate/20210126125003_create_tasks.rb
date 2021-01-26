class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done, default: false
      t.references :project, null: false, foreign_key: true
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
