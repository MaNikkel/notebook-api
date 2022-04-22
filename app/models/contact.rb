class Contact < ApplicationRecord
  belongs_to :kind

  def valid
    true
  end

  # redefines as_json method to include valid method
  def as_json(options = {})
    super(options.merge(methods: [:valid], root: true))
  end
end
