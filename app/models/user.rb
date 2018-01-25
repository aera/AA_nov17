class User < ApplicationRecord
  has_many :answers, dependent: :nullify
  has_many :questions, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question

  has_many :stars, dependent: :destroy
  has_many :starred_answers, through: :stars, source: :answer

  has_many :votes, dependent: :destroy
  has_many :voted_questions, through: :votes, source: :question

  geocoded_by :address
  after_validation :geocode

  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :history, :finders]


  # `has_secure_password` is a built-in Rails method for models that
  # provides user authentication features:
  # 0. It will add two attribute accessors for `password` and
  #    `password_confirmation`.
  # 1. It will automatically add a presence validator for the password field
  # 2. When given a password, it will hash it with bcrypt and save it in
  #    the `password_digest` column.
  # 3. It will add the instance method `authenticate` which can be used to
  #    to verify a user's password. If the correct password is entered,
  #    it will return the authenticated user otherwise it will return `false`.

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # The following validations verifies that emails exists and are unique.
  # As well, it veries using a regular expression that email respects a certain
  # format meaning that the beginning email should have valid characters
  # (e.g. alphabet, +, -, numbers, .), the middle has a `@` and that the end
  # also only contains valid characters.
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  # `validates` can take multiple column names as its first arguments. All
  # validation rules provided will apply all given columns.
  validates :first_name, :last_name, presence: true

  before_create :generate_api_key

  def full_name
    "#{first_name} #{last_name}"
  end

  private
  def generate_api_key
    # We may accidently generate an api key that a user already owns.
    # To prevent from saving a duplicate key, we'll loop until
    # we can't find any users with that key.
    loop do
      # SecureRandom.hex(32) will generate a large string of random hex
      # characters (i.e A-F & 0-9)
      # We'll use this as user's api key for authentication with our
      # web api.
      self.api_key = SecureRandom.hex(32)
      break unless User.exists?(api_key: api_key)
    end
  end

end
