class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t,integer :post_id, null: false
      t.text :text, null: false
      t.references :user, foreign_key: { on_delete: :cascade }
      t.references :post, foreign_key: { on_delete: :cascade }
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
