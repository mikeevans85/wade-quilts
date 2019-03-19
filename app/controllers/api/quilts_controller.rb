class Api::QuiltsController < ApplicationController

# These are controllers for public-facing pages. See admin_controller for admin pages (create, patch, delete, etc.)
  def index
	@quilts = Quilt.all
	render "index.json.jbuilder"
  end

  def create
  	 @quilt = Quilt.new(
      name: params["name"],
      size: params["size"],
      description: params["description"],
      price: params["price"],
      )
    @quilt.save
    if @quilt.save
      ImageBank.create(
        description: params["description"],
        quilt_id: @quilt.id)
      render "show.json.jbuilder"
    else
      render json: {errors: @quilt.errors.full_messages}, status: 422
    end
  end

  def show
    @quilt = Quilt.find_by(id: params["id"])
    render "show.json.jbuilder"
  end

  def update
    @quilt = Quilt.find_by(id: params["id"])
    @quilt.name = params["name"] || @quilt.name
    @quilt.size = params["size"] || @quilt.size
    @quilt.description = params["description"] || @quilt.description
    @quilt.price = params["price"] || @quilt.price
    @quilt.save
    if @quilt.save
      render "show.json.jbuilder"
    else
      render json: {errors: @quilt.errors.full_messages}, status: 422
    end
  end

  def destroy
    @quilt = Quilt.find_by(id: params["id"])
    @quilt.destroy
    render json: {message: "Your quilt has sadly and successfully been deleted."}
  end
end
