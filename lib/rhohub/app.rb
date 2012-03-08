class Rhohub::App < Rhohub::Base
  
  def self.create(data = @attributes, options)
    super(data,options)
  end
  
  # options = {:id => app_id}
  def self.delete(options)
    super(options)
  end
  
  def self.list
    super({})
  end
  
  # options = {:id => app_id}
  def self.show(options)
    super(options)
  end
  
end