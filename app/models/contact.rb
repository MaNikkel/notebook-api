class Contact < ApplicationRecord
  belongs_to :kind

  def valid
    true
  end

  def birthdate_br
    I18n.localize(birthdate) unless birthdate.blank?
  end

  # redefines as_json method to include valid method
  def as_json(options = {})
    super(options.merge(
      root: true,
      methods: [:birthdate_br],
      include: { kind: { only: %i[description id] } }
    ))
  end
end
