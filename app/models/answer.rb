class Answer < ApplicationRecord
  belongs_to :user
  # When the Answer model was generated, the option `question:references`
  # added the line to this model.
  # This means that in the relationship between Answer <> Question the
  # answer holds the `question_id`.
  belongs_to :question #, optional: true
  # `belongs_to` implicitly enforces a validation that an association must
  # be present meaning that the `question_id` must be present and contain
  # a valid id to an existing question. Disable that requirement providing
  # the option `optional: true` to the `belongs_to` method.

  has_many :stars, dependent: :destroy
  has_many :starring_users, through: :stars, source: :user

  # `belongs_to :question` will add the following instance methods to our
  # `Answer` model:

  # question
  # question=(associate)
  # build_question(attributes = {})
  # create_question(attributes = {})
  # create_question!(attributes = {})
  # reload_question

  validates :body, presence: true

end






## bump
