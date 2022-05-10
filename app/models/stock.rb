# frozen_string_literal: true

#
# Stock Model
#
class Stock < ApplicationRecord
  include Deletable

  attr_accessor :bearer_attributes

  belongs_to :bearer
  validates :name, presence: true, uniqueness: true
  before_validation :set_bearer, on: :create

  private

  def set_bearer
    return nil unless bearer_attributes.present? && bearer_attributes.is_a?(Hash)

    self.bearer = Bearer.find_or_create_by(bearer_attributes)
  end
end
