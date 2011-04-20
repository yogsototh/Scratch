
def getMainpage
    if @item.parent.nil? or @item.parent.parent.nil? or @item.parent.parent.parent.nil?
        return
    end
    if @item.parent.parent.parent.parent.nil?
        return @item
    else
        return @item.parent
    end
end

def generateIntenseDebateThread
    mainpage=getMainpage
    protectedPath=mainpage.path.gsub(/'/,"%27")
    protectedTitle=mainpage[:title].gsub(/'/,"%27")
    %{
    <script type="text/javascript">
    var idcomments_acct = 'a307f0044511ff1b5cfca573fc0a52e7';
    var idcomments_post_id = '#{protectedPath}';
    var idcomments_post_url = 'http://yannesposito.com#{protectedPath}';
    </script>
    <span id="IDCommentsPostTitle" style="display:none"></span>
    <script type='text/javascript' src='#{@config[:webprefix]}/js/genericCommentWrapperV2.js'></script>
    }
end
