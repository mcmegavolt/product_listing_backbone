class ProductListingBackbone.Models.Product extends Backbone.Model
  paramRoot: 'product'

  defaults:
    name: null
    description: null
    price: null

class ProductListingBackbone.Collections.ProductsCollection extends Backbone.Collection
  model: ProductListingBackbone.Models.Product
  url: '/products'
