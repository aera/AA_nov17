class Question < ApplicationRecord
  belongs_to :user
  # Like `belongs_to`, `has_many` tells Rails that Question is associated to the
  # Answer model.
  # It implies that the model where `has_many` is defined doesn't have the
  # the foreign_key (i.e. question_id) meaning that the `answers` has
  # the `question_id`.
  has_many :answers, dependent: :destroy
  # `dependent: :destroy` will cause all associated answers to be destroyed
  # when the associated is destroyed.

  # `dependent: :nullify` will cause all associated answers to no longuer
  # associated before a question is destrored. In other words, their
  # `question_id` column will be set to `NULL`.

  has_many :likes, dependent: :destroy
  # has_many :users, through: :likes
  has_many :likers, through: :likes, source: :user

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  extend FriendlyId
  # history: will store slug history in friendly_id_slugs table
  # finders: will make it so we can use use Question.find as we did with normal
  #          id so we don't need to change anything.
  friendly_id :title, use: [:slugged, :history, :finders]

  mount_uploader :image, ImageUploader

  # if you want to user friendly_id gem, make sure to comment out to_param
  # def to_param
  #   "#{id}-#{title}".parameterize
  # end

  # `has_many :answers` will add the following instance methods to the
  # the Question model:

  # answers
  # answers<<(object, ...)
  # answers.delete(object, ...)
  # answers.destroy(object, ...)
  # answers=(objects)
  # answer_ids
  # answer_ids=(ids)
  # answers.clear
  # answers.empty?
  # answers.size
  # answers.find(...)
  # answers.where(...)
  # answers.exists?(...)
  # answers.build(attributes = {}, ...)
  # answers.create(attributes = {})
  # answers.create!(attributes = {})
  # answers.reload

  # We can define validations here that'll be checked before a model is saved
  # to the database. If any of the rules fail, ActiveRecord will prevent saving
  # it by doing a rollback and will also add error message to the model instance.
  # You can access these error message with the `error` method. You can
  # nicer print out of those message by using `error.full_messages`.
  # For example:
  # q = Question.new
  # q.save
  # q.errors.full_messages

  # You can also check if a model instance is valid without trying to save to the
  # database by using the method `valid?`
  validates(
    :title,
    presence: {message: "must be given"},
    uniqueness: true
  )

  validates :body, presence: true, length: {minimum: 5, maximum: 2000}
  validates :view_count, numericality: {greater_than_or_equal_to: 0}

  # When writing your custom validation method instead use the `validate` method.
  # Note that it is not plural. Its first argument is a symbol that is the name
  # of a method inside of your model (whatever name you want).
  # This method will be run during the validation phase and if it adds
  # any error to the model instance it will fail the validation.
  validate :no_monkey

  before_validation(:set_view_count)

  def votes_result
    votes.where({ is_up: true }).count - votes.where({ is_up: false }).count
  end

  private
  def no_monkey
    if title.present? && title.downcase.include?('monkey')
      errors.add(:title, "should not have a monkey! ð")
    end

    if body.present? && body.downcase.include?('monkey')
      errors.add(:body, "should not have a monkey! ð")
    end
  end

  def set_view_count
    # When referring to attributes of a class (or class instance), we must
    # use `self.` only when writing to that attribute. When reading, `self.`
    # can be optionally omitted.
    self.view_count ||= 0
  end
end











# bump
