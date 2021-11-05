class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.string  :visited_short_url, null: false

      t.timestamps
    end

    add_index :visits, :visitor_id
    add_index :visits, :visited_short_url
  end
end
