class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.string :team
      t.string :profile_pic
      t.integer :phone_number

      t.timestamps
    end
  end
end
