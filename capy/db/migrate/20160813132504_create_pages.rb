class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.bigint :last_date
      t.bigint :last_duration
      t.string :browser_name
      t.string :browser_version
      t.string :url
      t.integer :visits
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
