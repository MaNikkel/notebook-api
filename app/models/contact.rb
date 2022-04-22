class Contact < ApplicationRecord
  belongs_to :kind

  def valid
    true
  end

  # redefines as_json method to include valid method
  def as_json(options = {})
    super(options.merge(
      root: true,
      methods: [:valid],
      include: { kind: { only: %i[description id] } }
    ))
  end
end
