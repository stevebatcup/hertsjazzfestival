require "administrate/field/base"

class NonEditableStringField < Administrate::Field::Base
  def to_s
    data
  end
end
