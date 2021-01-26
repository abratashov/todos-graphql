class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
