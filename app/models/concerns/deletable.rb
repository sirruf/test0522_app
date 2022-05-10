# frozen_string_literal: true

#
# Soft delete
#
module Deletable
  extend ActiveSupport::Concern

  included do
    default_scope { where(deleted: false) }
    scope :deleted_only, -> { unscope(where: :deleted).where(deleted: true) }
  end

  def delete
    update_column :deleted, true if has_attribute? :deleted
  end

  def destroy
    result = transaction do
      run_callbacks(:destroy) do
        delete
      end
    end
    result ? self : false
  end
end
