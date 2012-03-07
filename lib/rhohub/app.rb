class Rhohub::App < Rhohub::Base
  
  def create(data = @attributes, options)
    super(data,options)
  end
  
  def delete(options)
    super(options)
  end
  
  def list
    super({})
  end
  
  def show(options)
    super(options)
  end
  
end