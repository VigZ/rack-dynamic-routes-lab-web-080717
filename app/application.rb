class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      searched = req.path.split("/items/").last
      if @@items.find{|i| i.name == searched}
        found = @@items.find{|i| i.name == searched}
        resp.write found.price
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
