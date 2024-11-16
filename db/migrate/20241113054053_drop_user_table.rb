class DropUserTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :users, if_exists: true
  end
end
