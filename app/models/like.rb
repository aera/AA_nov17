class Like < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # the line below will validate the uniqueness of user_id/question_id combo
  # which means user_id doesn't have to be unique by itself and question_id
  # doesn't have to be unique by itself but the combination must be unique
  # validates :question_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :question_id }
end
