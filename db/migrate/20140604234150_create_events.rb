class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name, :description, :when
    	t.integer :creator_id
    	
      t.timestamps
    end
  end
end
