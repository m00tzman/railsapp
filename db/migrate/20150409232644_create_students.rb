class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.string :full_name
      t.string :phone

      t.timestamps null: false
    end
  end
end
