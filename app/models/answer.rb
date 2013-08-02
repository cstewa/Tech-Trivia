class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :content, :is_correct, :question_id
end
