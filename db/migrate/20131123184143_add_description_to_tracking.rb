class AddDescriptionToTracking < ActiveRecord::Migration
  def change
    add_column :trackings, :description, :text
  end
end
