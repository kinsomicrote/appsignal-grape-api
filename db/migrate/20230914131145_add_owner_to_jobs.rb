class AddOwnerToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :user, foreign: true
  end
end
