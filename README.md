# README

## Setup
1. clone this repo
2. run `bundle install`
3. run `bin/rails db:setup`
4. run `bin/rails test`

## Reading the output

```ruby
#...
#...
#...
{ #1
         :location => "Variant#do_somthing",
    :saved_changes => {
             "brand" => [
            [0] "yyy",
            [1] "variant_new_brand"
        ],
        "updated_at" => [
            [0] Tue, 17 Jan 2023 14:25:46.842496000 UTC +00:00,
            [1] Tue, 17 Jan 2023 14:25:46.845726000 UTC +00:00
        ]
    }
}
{ #2
         :location => "Product#do_somthing",
    :saved_changes => {}
}
```

The code that produce #1 and #2 is from `test/models/product_test.rb:8`. I try to update the product with nested attributes and you can see that `saved_changes` in Variant was present while it wasn't in Product.

## Let go deeper

```ruby
class Variant < ApplicationRecord
  belongs_to :product#, inverse_of: :variants, autosave: true

  # accepts_nested_attributes_for :product

  after_save :do_something

  def do_something
    ap({
      location: "Variant#do_somthing",
      saved_changes: saved_changes
    })
  end
end
```

Try comment out some code in `variant.rb` and then run the `bin/rails test` again. You can see that, this time, the `saved_changes` are present for both variant and product.

## Conclusion
I don't know....just beware when you are using `accept_nested_attributes` with `saved_changes` helper in ActiveRecord.