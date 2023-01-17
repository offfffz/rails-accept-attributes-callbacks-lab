class Variant < ApplicationRecord
  belongs_to :product, inverse_of: :variants, autosave: true

  accepts_nested_attributes_for :product

  after_save :do_something

  def do_something
    ap({
      location: "Variant#do_somthing",
      saved_changes: saved_changes
    })
  end
end
