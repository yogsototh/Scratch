
def getMainpage
    if depthOf(@item) <= 4 then
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
    <script type=”text/javascript” src=”http://www.intensedebate.com/js/genericCommentWrapperV2.js”></script>
    }
end
