require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "xxxxx" do
    product = Product.create(name: 'product_1', brand: 'xxx')
    variant = Variant.create(name: 'variant_1', brand: 'yyy', product: product)

    product.update(
      brand: 'product_new_brand',
      variants_attributes: [{
        id: variant.id,
        brand: 'variant_new_brand'
      }]
    )

    assert_equal 'product_new_brand', product.reload.brand
    assert_equal 'variant_new_brand', variant.reload.brand
  end
end
