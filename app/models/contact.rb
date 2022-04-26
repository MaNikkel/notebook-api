class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def valid
    true
  end

  # redefines as_json method to include valid method
  def as_json(options = {})
    h = super(options.merge(
      include: { kind: { only: %i[description id] }, phones: { except: [:contact_id] } }
    ))

    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)

    h
  end
end
