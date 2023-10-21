class CreateTagSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_saunas do |t|
      t.references :sauna, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
