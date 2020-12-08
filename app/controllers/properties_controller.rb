class PropertiesController < ApplicationController
  def index
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
      format.json { render json: @properties }
    end
  end
end
