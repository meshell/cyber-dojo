class CreateDojoStartPoints < ActiveRecord::Migration
  def change
    create_table :dojo_start_points do |t|
      t.string :dojo_id
      t.string :language
      t.string :exercise

      t.timestamps
    end
  end
end