class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cns = Cns.new(value:)

    record.errors.add attribute, (options[:message] || 'não é valido') unless cns.valid?
  end
end
