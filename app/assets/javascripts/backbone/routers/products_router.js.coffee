class ProductListingBackbone.Routers.ProductsRouter extends Backbone.Router
  initialize: (options) ->
    @products = new ProductListingBackbone.Collections.ProductsCollection()
    @products.reset options.products

  routes:
    "new"      : "newProduct"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newProduct: ->
    @view = new ProductListingBackbone.Views.Products.NewView(collection: @products)
    $("#products").html(@view.render().el)

  index: ->
    @view = new ProductListingBackbone.Views.Products.IndexView(products: @products)
    $("#products").html(@view.render().el)

  show: (id) ->
    product = @products.get(id)

    @view = new ProductListingBackbone.Views.Products.ShowView(model: product)
    $("#products").html(@view.render().el)

  edit: (id) ->
    product = @products.get(id)

    @view = new ProductListingBackbone.Views.Products.EditView(model: product)
    $("#products").html(@view.render().el)
