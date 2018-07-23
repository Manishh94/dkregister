class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :invitation_code
      t.integer :user_id
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
