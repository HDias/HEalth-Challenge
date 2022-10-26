class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cns = Cns.new(value:)

    record.errors.add attribute, (options[:message] || 'is not a CNS valid') unless cns.valid?
  end
end
