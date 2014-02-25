module ApplicationHelper

	def round float
		number_with_precision(float, precision: 1)
	end
end
