class ProductClass < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  set_primary_key "code"
  attr_accessible :code, :name
end
