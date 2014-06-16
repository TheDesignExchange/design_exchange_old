module DeHelper
	def thumbnail(obj)

		str = "<div class='col-sm-6 col-md-4 left-top-padding'>
   			<div class='thumbnail'>
   				<div class='image-wrapper'>
	  		   		<img src='#{obj[:url]}'>
	  			</div>
  		   		<div class='caption'>
  		     		<h3>"+
  		(link_to "#{obj[:name]}", "/methods/view")+ 
  		"</h3><p><span class='glyphicon glyphicon-star'></span> #{obj[:likes]} Likes</p>
  		     		<p> #{obj[:description]}</p>"+ 
  		     		tagifier(obj[:tags])+
  		   		"</div>
  	  		</div>
  		</div>"
  		str.html_safe
	end

	def tagifier(obj)
		str = obj.map do |x|
			category = x.split(" ")
			if category[1] then category[1] = category[1].humanize end
			category = category.join('');
		category = category.underscore().dasherize
				"<span class='label label-gap label-#{category}'>#{x}</span>"
		end
		"<p>"+str.join('')+"</p>"
	end
end
