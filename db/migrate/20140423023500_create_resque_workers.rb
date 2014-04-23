class CreateResqueWorkers < ActiveRecord::Migration
  def change
    create_table :resque_workers do |t|

      t.timestamps
    end
  end
end
