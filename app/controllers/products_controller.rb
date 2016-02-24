require 'csv'


class ProductsController < ApplicationController
    def list
        @products = get_stuff.sort_by(&:pid)

    end

    def welcome
    end

    def view
        @products = get_stuff

        @product = @products.find {|product| product.pid == params[:pid]}
    end

    def get_stuff
        @products = []
        CSV.foreach("mf_inventory.csv", headers: true) do |row|
            product = Product.new
            product.pid = row.to_h["pid"]
            product.item = row.to_h["item"]
            product.price = row.to_h["price"]
            product.img_file = row.to_h["img_file"]
            product.quantity = row.to_h["quantity"]
            product.condition = row.to_h["condition"]
            product.description = row.to_h["description"]
            product.dimension_w = row.to_h["dimension_w"]
            product.dimension_l = row.to_h["dimension_l"]
            product.dimension_h = row.to_h["dimension_h"]
        @products << product
    end

        @products
  end

end
