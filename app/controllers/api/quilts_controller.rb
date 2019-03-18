class Api::QuiltsController < ApplicationController

# These are controllers for public-facing pages. See admin_controller for admin pages (create, patch, delete, etc.)
  def index
	@quilts = Quilt.all
	render "index.json.jbuilder"
  end

  def show
    @quilt = Quilt.find_by(id: params["id"])
    render "show.json.jbuilder"
  end
end
