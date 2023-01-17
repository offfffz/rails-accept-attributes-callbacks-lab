class Variant < ApplicationRecord
  belongs_to :product, inverse_of: :variants, autosave: true
  after_save :do_something

  accepts_nested_attributes_for :product

  def do_something
    ap({
      location: "Variant#do_somthing",
      saved_changes: saved_changes
    })
  end
end
