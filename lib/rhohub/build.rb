class Rhohub::Build < Rhohub::Base
  
  # options = {:app_id => app_id}
  def self.create(data = @attributes, options)
    super(data,options)
  end
  
  # options = {:id => build_id}
  def self.delete(options)
    super(options)
  end
  
  # options = {:app_id => app_id}
  def self.list(options)
    super(options)
  end
  
  # options = {:id => build_id}
  def self.show(options)
    super(options)
  end
end