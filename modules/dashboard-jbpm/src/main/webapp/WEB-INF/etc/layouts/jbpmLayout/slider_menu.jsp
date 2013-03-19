<%--

    Copyright (C) 2012 JBoss Inc

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<script language="JavaScript" type="text/javascript">
    <!--
    var aSlideSideMenu = new Object();
    aSlideSideMenu.minWidth = 0;
    aSlideSideMenu.maxWidth = 260;
    aSlideSideMenu.increment = 30;
    aSlideSideMenu.speed = 5;
    aSlideSideMenu.divStyleToMove = null;
    aSlideSideMenu.cookieName = "region_left_web_2_0_cookie";
    aSlideSideMenu.getCookieVal = function (offset) {
        var endstr = document.cookie.indexOf (";", offset);
        if (endstr == -1)
            endstr = document.cookie.length;
        return unescape(document.cookie.substring(offset, endstr));
    }
    aSlideSideMenu.GetCookie = function (name)  {
        var arg = name + "=";
        var alen = arg.length;
        var clen = document.cookie.length;
        var i = 0;
        while (i < clen)
        {
            var j = i + alen;
            if (document.cookie.substring(i, j) == arg)
                return this.getCookieVal (j);
            i = document.cookie.indexOf(" ", i) + 1;
            if (i == 0) break;
        }
        return null;
    }

    aSlideSideMenu.SetCookie = function (name, value) {
        var argv = this.SetCookie.arguments;
        var argc = this.SetCookie.arguments.length;
        var expires = (argc > 2) ? argv[2] : null;
        var path = (argc > 3) ? argv[3] : null;
        var domain = (argc > 4) ? argv[4] : null;
        var secure = (argc > 5) ? argv[5] : false;
        document.cookie = name + "=" + escape (value) +
                ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
                ((path == null) ? "; path=/" : ("; path=" + path)) +
                ((domain == null) ? "" : ("; domain=" + domain)) +
                ((secure == true) ? "; secure" : "");
    }

    aSlideSideMenu.EvaluateInitialStatus = function () {
        if ( (IE && document.readyState != 'complete') || !document.getElementById("region_left_web_2_0")) {
            setTimeout("aSlideSideMenu.EvaluateInitialStatus()",100);
        } else {
            this.divStyleToMove = document.getElementById("region_left_web_2_0").style;
            //this.divStyleToMove.width = this.maxWidth+'px';
            var state = this.GetCookie(this.cookieName) ;
            state = state == null ? 1 : state;
            if( state == 1 ){
                this.openIt( );
            } else {
                this.SetCookie(this.cookieName, 0);
                this.divStyleToMove.width = this.minWidth+'px';
            }
        }
    }

    aSlideSideMenu.start = function() {
        var state = this.GetCookie(this.cookieName) ;
        state = state == null ? 0 : state;
        if (state == 1) this.slide(null, true);
        else this.slide(null, false);
    }

    aSlideSideMenu.slide = function( pos , back){
        this.divStyleToMove.overflow = 'hidden';
        this.divStyleToMove.display = 'block';
        pos = (pos != null) ? pos : (back ? this.maxWidth: this.minWidth);
        if(pos < this.minWidth) pos = this.minWidth;
        if(pos > this.maxWidth) pos = this.maxWidth;
        this.divStyleToMove.width =  pos + "px";
        //alert("Move "+(back?"back":"")+" div to pos "+pos);
        var end = back ? (pos<=this.minWidth) : (pos>=this.maxWidth);

        if ( !end ){
            var totalIncrement = back ? (pos-this.increment):(pos+this.increment);
            setTimeout("aSlideSideMenu.slide("+totalIncrement+","+back+")", this.speed);
        } else {
            this.divStyleToMove.width =  (!back ? this.maxWidth: this.minWidth) + "px";
            this.divStyleToMove.overflow = back ? 'hidden':'visible';
            this.divStyleToMove.display = back ? 'none':'block';
            this.SetCookie(this.cookieName, back ? 0:1);
        }
    }

    aSlideSideMenu.openIt = function(){
        this.SetCookie(this.cookieName, 1);
        this.divStyleToMove.width = this.maxWidth + "px";
    }

    setTimeout ("aSlideSideMenu.EvaluateInitialStatus()",100);

    //-->
</script>
<style>
.top_row{
	background-color: #303030;
	-moz-box-shadow: 1px 4px 6px #111;
    -webkit-box-shadow: 1px 4px 6px #111;
    box-shadow: 1px 4px 6px #111;
    /* IE 8 */
    -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=6, Direction=180, Color='#111111')";
    /* IE 5.5 - 7 */
    filter: progid:DXImageTransform.Microsoft.Shadow(Strength=6, Direction=180, Color='#111111');
	border-bottom: solid 1px #FFF;
	width: 100%;
	z-index: 1000;
	position: relative;
}

.left_column{
	background-color: #c2c2c2;
	-moz-box-shadow: 4px 1px 6px #111;
    -webkit-box-shadow: 4px 1px 6px #111;
    box-shadow: 4px 1px 6px #111;
    /* IE 8 */
    -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=6, Direction=90, Color='#111111')";
    /* IE 5.5 - 7 */
    filter: progid:DXImageTransform.Microsoft.Shadow(Strength=6, Direction=90, Color='#111111');
	z-index: 999;
	position: relative;
}

.top_row H1 {
	margin: 0px 0px 0px 20px;
	color: #FFF;
}


</style>
<table border="0" cellpadding="0" cellspacing="0" class="top_row">
    <tr>
        <td align="left">
            <H1>Process Dashboard</H1>
        </td>
        <td>
            <table align="right">
                <tr>
                    <td><panel:region region="Header_Right-bottom"/></td><td><panel:region region="Header_Right-top"/></td>
                </tr>
            </table>


        </td>
    </tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td style="vertical-align:top; text-align:left; width:1%;" class="left_column">
            <%
                String display = "block";
                Cookie[] cookies = request.getCookies();
                if(cookies!=null)
                    for (int i = 0; i < cookies.length; i++) {
                        Cookie cookie = cookies[i];
                        if(cookie!=null && "region_left_web_2_0_cookie".equals(cookie.getName())) {
                            if("0".equals(cookie.getValue())){
                                display = "none";
                            }
                        }
                    }
            %>
            <div id="region_left_web_2_0" style="margin:0px; padding:0px; width: 260px; display: <%=display%>">
                <table cellpadding="0" cellspacing="0" style="width:100%; border:none; margin:0px; padding:0px;">
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><panel:region region="left_top"/></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0"  style="width:100%; border:none; margin-top:5px; padding:0px">
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><panel:region region="left_bottom"/></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </div>
        </td>
        <td style="width:10px; vertical-align:top; padding-top:25px;">
            <img onclick="aSlideSideMenu.start();return false;" src="bui/images/general/resize.gif" style="width:10px; height:40px; border:none; padding:1px; cursor:pointer" />
        </td>
        <td style="vertical-align:top; text-align:left; width:99%; padding-left: 15px; border-left: 1px dotted gray; height: 800px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr><td class="contentColumn" style="vertical-align:top;"><panel:region region="center_1"/></td><tr>
                <tr><td class="contentRow" 	  style="vertical-align:top;"><panel:region region="center_2"/></td><tr>
                <tr><td class="contentTab" 	  style="vertical-align:top;"><panel:region region="center_3"/></td><tr>
                <tr><td class="contentColumn" style="vertical-align:top;"><panel:region region="center_4"/></td><tr>
                <tr><td class="contentRow" 	  style="vertical-align:top;"><panel:region region="center_5"/></td><tr>
                <tr><td class="contentTab" 	  style="vertical-align:top;"><panel:region region="center_6"/></td><tr>
            </table>

            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="vertical-align:top;" class="contentColumn"><panel:region region="col2_1"/></td>
                    <td style="vertical-align:top;" class="contentColumn"><panel:region region="col2_2"/></td>
                <tr>
            </table>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="vertical-align:top;" class="contentColumn"><panel:region region="col3_1"/></td>
                    <td style="vertical-align:top;" class="contentColumn"><panel:region region="col3_2"/></td>
                    <td style="vertical-align:top;" class="contentColumn"><panel:region region="col3_3"/></td>
                <tr>
            </table>
        </td>
    </tr>
</table>