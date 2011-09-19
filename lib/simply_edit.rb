require "simply_edit/version"

module SimplyEdit
  def date_field_tag(*args)
    text_field_tag(*args)
  end

  def simply_edit(type, object, field, url, options = {})
    options[:class] = "#{options[:class]} simply_edit simple_edit_#{type}".strip    
    content_tag(:span, :class => options[:class]) do
      (link_to object.send(field).blank? ? "Edit Text" : object.send(field), "javascript:void(0);", :class => "simply_edit_link") + 
      content_tag(:span, :class => "simply_edit_fields", :style => "display:none;") do
        (eval("#{type}_tag('#{object.class.to_s.downcase}[#{field}]', object.send(field), :class => 'simply_edit_input')")) +
        content_tag(:span, :class => "simply_edit_actions") do
          (link_to("Save", "javascript:void(0);", :class => "simply_edit_save save", :"data-href" => url)) +
          (link_to("Cancel", "javascript:void(0);", :class => "simply_edit_cancel cancel"))
        end
      end      
    end    
  end
  
  %w(text_field text_area date_field).each do |method|
    define_method("simply_edit_#{method}") do |*args|
      simply_edit(method, *args)
    end
  end  
end

ActionView::Base.send(:include, SimplyEdit)