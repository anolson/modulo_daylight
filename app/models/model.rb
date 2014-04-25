class Model
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(attributes = {})
    attributes.each { |name, value|
       send "#{name}=", value
    }
  end
  
  def persisted?()
    false 
  end
  
  def new_record?() 
    true 
  end
end