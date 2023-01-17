class Product < ApplicationRecord
  has_many :variants, inverse_of: :product, autosave: true
  after_save :do_something

  accepts_nested_attributes_for :variants

  def do_something
    ap({
      location: "Product#do_somthing",
      saved_changes: saved_changes
    })
  end
end
