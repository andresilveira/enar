module ApplicationHelper
  def pagination_links(collection, options = {})
      options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
      options[:class] ||= 'center-block'
      options[:inner_window] ||= 2
      options[:outer_window] ||= 1
      will_paginate(collection, options)
    end
end
