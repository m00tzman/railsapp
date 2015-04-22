class AddPaidFullToStudents < ActiveRecord::Migration
  def change
    add_column :students, :paid_in_full, :boolean
  end
end
