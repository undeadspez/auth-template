module ApplicationHelper

  def full_title(title)
    if title
      "#{title} | #{Rails.configuration.app_name}"
    else
      "#{Rails.configuration.app_name}"
    end
  end

  # change the default link renderer for will_paginate
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => MyCustomLinkRenderer
    end
    super *[collection_or_options, options].compact
  end

  class MyCustomLinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected

      def html_container(html)
        tag(:nav, tag(:ul, html, { class: 'pagination' }), container_attributes)
      end

      def container_attributes
        { class: 'pagination justify-content-center', 'aria-label': 'user list navigation' }
      end

      def page_number(page)
        tag(:li, link(page, page, class: 'page-link', rel: rel_value(page)),
          class: ['page-item', ('active' if page == current_page)].compact.join(' '))
      end

      def gap
        tag(:li, link('&hellip;', '#', class: 'page-link'), class: 'page-item disabled')
      end

      def previous_or_next_page(page, text, classname)
        tag(:li, link(text, page || '#', class: 'page-link'), 
          class: ['page-item', ('disabled' unless page)].compact.join(' '))
      end

  end

end
