class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.integer :member_id, null: false
      t.string :tag_name, null: false
      t.timestamps
    end
    # タグ名に一意性制約を持たせたいため、UNIQUEを設定
    add_index :tags, [:tag_name], unique: true
  end
end
