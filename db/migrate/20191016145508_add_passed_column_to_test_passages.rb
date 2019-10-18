class AddPassedColumnToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :passed, :boolean, default: false

    TestPassage.all.each do |test_passage|
      test_passage.update_attributes(passed: test_passage.passed?)
    end

    change_column :test_passages, :passed, :boolean, null: false
  end
end
