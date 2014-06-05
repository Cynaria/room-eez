class Event < ActiveRecord::Base
	validates_presence_of :name, :when, :created_at
end
