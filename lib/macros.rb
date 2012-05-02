# usage:
# ---
# ...
# macros:
#   test: "passed test"
# ---
# ...
# Here is a %test.
#
class Macros < Nanoc3::Filter
    identifier :falacy
    attr_accessor :macro
    def initialize(arg)
        super
        @macro={}
        @macro[:tlal] = %{<span class="sc"><abbr title="Trop long à lire">tlàl</abbr> : </span>}
        @macro[:tldr] = %{<span class="sc"><abbr title="Too long; didn't read">tl;dr</abbr>: </span>}
        @macro[:mailperso] = %{<a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#121;&#097;&#110;&#110;&#046;&#101;&#115;&#112;&#111;&#115;&#105;&#116;&#111;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;">&#121;&#097;&#110;&#110;&#046;&#101;&#115;&#112;&#111;&#115;&#105;&#116;&#111;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;</a>}
        if @item.nil?
            if not arg.nil?
                @macro.merge!( arg )
            end
        else
            if not @item[:macros].nil?
                @macro.merge!( @item[:macros] )
            end
        end
    end
    def macro_value_for(macro_name)
        if macro_name.nil? or macro_name=="" or @macro[macro_name.intern].nil?
            return %{%#{macro_name}} 
        end
        return @macro[macro_name.intern]
    end
    def run(content, params={})
        content.gsub(/%(\w*)/) do |m| 
            if m != '%'
                macro_value_for($1)
            else
                m
            end
        end
    end
end

def tldr
    %{<span class="sc"><abbr title="Too long; didn't read">tl;dr</abbr>: </span>}
end

def tlal
    %{<span class="sc"><abbr title="Trop long à lire">tlàl</abbr> : </span>}
end

