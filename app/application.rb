class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|x| x.name == item_name}
    end

    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    elsif !item
      resp.write "Item not found"
      resp.status = 400
    else
      resp.write item.price
    end


    resp.finish
  end

end
