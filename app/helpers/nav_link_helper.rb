module NavLinkHelper
	# @TODO change method signature to accept hash of options to support class etc easier
	def nav_link(link_text, link_path,html_options = {})
	  class_name = current_page?(link_path) ? 'current' : ''

	  content_tag(:li, :class => class_name) do
	    link_to link_text, link_path, html_options
	  end
	end
end
