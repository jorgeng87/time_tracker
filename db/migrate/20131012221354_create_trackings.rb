class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.datetime :start
      t.datetime :stop
      t.integer :user_id

      t.timestamps
    end
  end
end
