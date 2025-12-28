class Wine < ApplicationRecord
  # Constants
  enum :color, red: 0, pink: 1, white: 2

  # Scopes

  # Callbacks

  # Attr_accessor

  # Associations
  has_many_attached :front_label_pictures
  has_many_attached :back_label_pictures

  has_many :purchases
  has_many :drinks
  has_many :stocks

  # Validations
  normalizes :aged, :bottling, :comment, :name, :titration, :variety, :volume, with: ->(string) { string.strip.presence }

  validates :name, :year, presence: true

  # Delegation

  # Methods
  def name_and_year
    "#{name} - #{year} "
  end

  def note
    drinks_notes = drinks.map(&:note).compact
    return unless drinks_notes.any?

    drinks_notes.sum / drinks_notes.length
  end

  def total_stock
    stocks.sum(&:quantity).to_i
  end
end
