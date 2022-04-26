class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones, allow_destroy: true

  def valid
    true
  end

  # redefines as_json method to include valid method
  def as_json(options = {})
    h = super(options.merge(
      include: [:phones, { kind: { only: %i[description id] } }]
    ))

    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)

    h
  end
end
