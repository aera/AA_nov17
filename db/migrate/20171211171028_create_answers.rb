class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true, index: true
      # 👆 will generate a column namd `question_id` of type
      # `bigint` (a really big integer) which is meant to refer
      # to a row of question in the `questions` table.

      t.timestamps
    end
  end
end
