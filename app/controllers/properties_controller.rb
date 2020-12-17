class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
  end

  def create
    Property.create(
      address: property_params[:address],
      lonlat: GeoHelper.point(property_params[:lon],property_params[:lat])
    )
    redirect_to properties_path
  end

  def destroy
    Property.find(params[:id]).destroy
    redirect_to properties_path
  end

  def search
    if request.format.json?
      json_data = JSON.parse(params[:bounds])
      points_list = json_data.push(json_data[0])

      points= GeoHelper.pairs_to_points(points_list)
      polygon = GeoHelper.polygon(points)

      @properties = Property.where(
        "ST_Covers(:polygon, ST_SetSRID(lonlat, :srid))",
        polygon: polygon,
        srid: GeoHelper::SRID
      )
    else
      @properties = Property.all
    end

    respond_to do |format|
      format.html
      format.json { render "index.json" }
    end
  end

  private

  def property_params
    params.require(:property).permit(:address, :lat, :lon)
  end
end
