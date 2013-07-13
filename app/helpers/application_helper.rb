module ApplicationHelper

  def flash_messages(*args)
    tag = :div; flash_info = nil

    if (args and !args.empty?)
      tag = args.shift
      if !args.empty?
        flash_info = args.collect {|key| content_tag(tag, flash[key], :id => key, :class => "#{key} message") if flash[key] }.join.html_safe
      end
    end

    content_tag(tag, flash_info, :id => "flash_messages")# if flash_messages?
  end

  def flash_messages?
    !flash.empty?
  end

end
