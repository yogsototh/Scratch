# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

def calendar_for( d, language="en" )
    if language == "fr"
        monthnames=[nil]+%w(Jan Fév Mar Avr Mai Jui Jul Aoû Sep Oct Nov Déc)
    else
        monthnames=[nil]+%w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    end
    %{<span class="date">
        <span class="day">#{d.day}</span>
        <span class="month">#{monthnames[ d.mon ]}</span>
        <span class="year">#{d.year}</span>
    </span> }
end
