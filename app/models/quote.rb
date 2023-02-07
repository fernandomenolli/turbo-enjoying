class Quote < ApplicationRecord
  belongs_to :company
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }
  has_many :line_item_dates, dependent: :destroy
  # broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
