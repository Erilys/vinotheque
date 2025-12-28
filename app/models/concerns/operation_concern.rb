# frozen_string_literal: true

module OperationConcern
  extend ActiveSupport::Concern

  included do
    belongs_to :wine
    belongs_to :location
  end
end
