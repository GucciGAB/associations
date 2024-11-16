class DropProfileTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :profiles, if_exists: true

  end
end
