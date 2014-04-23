class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :command
      t.belongs_to :schedule
      t.timestamps
    end
  end
end
