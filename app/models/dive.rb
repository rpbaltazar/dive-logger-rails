class Dive < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :location_name, :dive_date
end
