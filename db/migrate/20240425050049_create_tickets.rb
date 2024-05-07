class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :comments
      t.string :createdby
      t.string :modifiedby
      t.string :status
      t.string :assigned_to_user
      t.integer :assigned_to_user_id

      t.timestamps
    end
  end
end
