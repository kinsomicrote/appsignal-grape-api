class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true, unique: true
      t.string :email, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
