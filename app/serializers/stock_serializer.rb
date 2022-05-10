# frozen_string_literal: true

#
# Stock Serializer
#
class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :errors

  belongs_to :bearer, serializer: BearerSerializer

  def errors
    object.errors.full_messages
  end
end
