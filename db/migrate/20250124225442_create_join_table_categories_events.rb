class CreateJoinTableCategoriesEvents < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :events do |t|
      t.index :category_id
      t.index :event_id
    end
  end
end
