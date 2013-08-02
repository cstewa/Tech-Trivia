class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :question
      t.boolean :is_correct

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
