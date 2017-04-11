class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.text :keywords
      t.text :search_result

      t.timestamps null: false
    end
  end
end
