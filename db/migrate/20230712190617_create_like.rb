class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
