class Survey < ApplicationRecord
  validates :body, presence: true

  has_many :options, dependent: :destroy
  # this will allows us to create options at the same time we create survey
  # example:
  # Survey.create({ body: 'abc', options_attributes: { '0' => { body: 'option 1' }, '12' => { body: 'option 2' } }})

  accepts_nested_attributes_for :options, reject_if: :all_blank,
                                          allow_destroy: true

end
