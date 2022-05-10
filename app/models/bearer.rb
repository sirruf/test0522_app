# frozen_string_literal: true

#
# Bearer Model
#
class Bearer < ApplicationRecord
  include Deletable
  has_many :stocks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
