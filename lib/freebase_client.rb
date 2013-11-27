class FreebaseClient
  def self.all_professions
		resource = FreebaseAPI.session.mqlread([{
			:type => '/people/profession',
		  :id => nil,
		  :name => nil,
		  :'wiki_en:key' => {
    			:'/type/key/namespace' => "/wikipedia/en_id"
  		},
  		# :corresponding_type => [],
  		# :specialization_of => [],
  		# :specializations => [],
    	:limit => 1500
		}])
	end

	def self.all_cities
		resource = FreebaseAPI.session.mqlread([{
			:type => '/location/country',
		  :name => "United Kingdom",
		  :"/location/location/contains" => [{
		  	:id => nil,
		    :name => nil,
		    :type => "/location/citytown",  
			  :'wiki_en:key' => {
	    			:'/type/key/namespace' => "/wikipedia/en_id"
	  		},
    		:'/location/location/contains' => {
      		:return => "count"
    		},
    		:sort => "-/location/location/contains.count",
    		:limit => 1500
  		}]
		}])
	end
end