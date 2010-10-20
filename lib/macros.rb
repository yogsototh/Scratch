class Macros < Nanoc3::Filter
    identifier :falacy
    attr_accessor :macro
    def initialize(arg)
        super
        @macro={}
        @macro[:tlal] = %{<span class="sc"><abbr title="Trop long à lire">tlàl</abbr> : </span>}
        @macro[:tldr] = %{<span class="sc"><abbr title="Too long; don't read">tl;dr</abbr>: </span>}
        if not $macros.nil?
            @macro.merge!( $macros )
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
    %{<span class="sc"><abbr title="Too long; don't read">tl;dr</abbr>: </span>}
end

def tlal
    %{<span class="sc"><abbr title="Trop long à lire">tlàl</abbr> : </span>}
end

