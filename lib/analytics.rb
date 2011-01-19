# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

def genAnalytics
    %{<script type="text/javascript">
   var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
   document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
   </script>
   <script type="text/javascript">
   try {
   var pageTracker = _gat._getTracker("UA-10612400-1");
   pageTracker._trackPageview();
   } catch(err) {}</script>}
end

def clicky_analytics
    clickyid=66374971
%{<script type="text/javascript">
        var clicky = { log: function(){ return; }, goal: function(){ return; }};
        var clicky_site_id = #{clickyid};
        (function() {
              var s = document.createElement('script');
              s.type = 'text/javascript';
              s.async = true;
              s.src = ( document.location.protocol == 'https:' ? 'https://static.getclicky.com/js' : 'http://static.getclicky.com/js' );
              ( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
        })();
</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="http://in.getclicky.com/#{clickyid}ns.gif" /></p></noscript>
    }
end
