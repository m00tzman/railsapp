class AddHeroToStudents < ActiveRecord::Migration
  def change
    add_column :students, :hero, :string
  end
end
