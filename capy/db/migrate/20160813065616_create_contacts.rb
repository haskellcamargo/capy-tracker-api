class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    drop_table :contacts

    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :session

      t.timestamps
    end
  end
end
