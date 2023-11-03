class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :role, null: false
      t.string :salary, null: false
      t.boolean :draft_mode, default: true, null: false

      t.timestamps
    end
  end
end
