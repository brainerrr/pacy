require 'rqrcode'
class TablesController < ApplicationController
  def qr_code
    @table = Table.find(params[:id])

    # this comes from the documentation
    qrcode = RQRCode::QRCode.new(restaurant_meals_url(@table.restaurant, table_id: @table.id))
    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end
end
