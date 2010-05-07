# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

def calendar_for( d, language="en" )
    if language == "fr"
        monthnames=[nil]+%w(Jan Fév Mar Avr Mai Jui Jul Aoû Sep Oct Nov Déc)
    else
        monthnames=[nil]+%w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    end
    %{<div class="date">
        <div class="day">#{d.day}</div>
        <div class="month">#{monthnames[ d.mon ]}</div>
        <div class="year">#{d.year}</div>
    </div> }
end
