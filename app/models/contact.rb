class Contact < ApplicationRecord
  def valid
    true
  end

  # redefines as_json method to include valid method
  def as_json(options = {})
    super(options.merge(methods: [:valid]))
  end
end
