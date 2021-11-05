class AddShortUrlIdToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :short_url_id, :integer
    add_index :visits, :short_url_id
    remove_index :visits, :visited_short_url
  end
end
