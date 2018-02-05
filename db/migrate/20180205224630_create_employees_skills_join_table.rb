class CreateEmployeesSkillsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :employees_skills do |t|
      t.column :employee_id, :integer
      t.column :skill_id, :integer
    end
  end
end
