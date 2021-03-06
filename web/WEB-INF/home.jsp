<%
    LinkedList<User> userList = (LinkedList<User>)session.getAttribute("users");
    if(userList == null){
        userList = new LinkedList<User>();
    }
    LinkedList<Post> postLinkedList = (LinkedList<Post>)request.getAttribute("posts");
    if(postLinkedList == null){
        postLinkedList = new LinkedList<Post>();
    }
    LinkedList<Comment> commentLinkedList = (LinkedList<Comment>)request.getAttribute("comments");
    if(commentLinkedList == null){
        commentLinkedList = new LinkedList<Comment>();
    }
    String currentUserName = (String) session.getAttribute("currentUserName");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="se.molk.blog.domain.Comment" %>
<%@ page import="se.molk.blog.domain.Post" %>
<%@ page import="se.molk.blog.domain.User" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Home</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.3.0/animate.min.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>

    <style>
        body{
            background-attachment: fixed
        }
        .inner-addon {
            position: relative;
        }

        /* style icon */
        .inner-addon .glyphicon {
            position: absolute;
            padding: 10px;
            pointer-events: none;
        }

        /* align icon */
        .left-addon .glyphicon  { left:  15px;}
        .right-addon .glyphicon { right: 15px;}

        /* add padding  */
        .left-addon input  { padding-left:  30px; }
        .right-addon input { padding-right: 30px; }

        /*#nav {
            background-color: #102444;;
            color: white;
            height: 90px;
            left: 0;
            right: 0;
            box-shadow: 0 0 20px 10px #102444;
        }*/
        #nav_list a:hover{
            background-color: #f06fff;
            box-shadow: 0 0 20px 10px #f06fff;
            color: #fff;
            bottom: 5px;
            height: 45px;
        }
        #hone_hone_clock_bg{
            position:absolute;
            top: 45px;
            left: 225px;
            width: 135px;
            height: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 20px 10px #ffffff;
        }
        #hone_hone_clock{
            position: absolute;
            top: 10px;
            left: 220px;
        }
        #user_list{
            background-color: #f5f5f5;
            box-shadow: 0 0 10px 5px #f5f5f5;
        }
        #post_list{
            background-color: #ffffff;
            box-shadow: 0 0 10px 5px #ffffff;
        }
        #hamster{
            position: fixed;
            bottom: 0;
            right: 0;
        }
        .breath {
            right:0;
            margin:20px auto;
            text-indent:-999em;
            height:4px;
            line-height: 4px;
            width: 700px;
            overflow:hidden;
            background: #99dd33;
            color: #fff;
            opacity:0.1;
            -webkit-box-shadow: 0 0 5px #99dd33;
            -moz-box-shadow: 0 0 5px #99dd33;
            -ms-box-shadow: 0 0 5px #99dd33;
            -o-box-shadow: 0 0 5px #99dd33;
            box-shadow: 0 0 5px #99dd33;
            -webkit-border-radius:2px;
            -moz-border-radius:2px;
            -ms-border-radius:2px;
            -o-border-radius:2px;
            border-radius:2px;
            -webkit-animation-name: breath;
            -webkit-animation-duration: 6s;     /* breath duration */
            -webkit-animation-timing-function: ease-in-out;
            -webkit-animation-iteration-count: infinite;
        }
        @-webkit-keyframes 'breath' {
        from {
            opacity:0.1;
        }
        50% {
            opacity:1;
        }
        to {
            opacity:0.1;
        }
        }
        @-webkit-keyframes 'breath2' {
        from {
            opacity:0.5;
        }
        50% {
            opacity:1;
        }
        to {
            opacity:0.5;
        }
        }
        .size2{
            position: fixed;
            bottom: 180px;
            right: 0;
            width:100px;
            height:30px;
            line-height:25px;
            text-indent:0;
            background:orange;
            text-align:center;
            text-shadow:1px 1px 3px #333;
            -webkit-box-shadow:0 0 5px orange;
            -moz-box-shadow: 0 0 5px orange;
            -ms-box-shadow: 0 0 5px orange;
            -o-box-shadow: 0 0 5px orange;
            box-shadow: 0 0 5px orange;
            -webkit-animation-name: breath2;
        }

    </style>

</head>
<body background="img/bg-light-purple.jpg">

    <div id="nav">
        <nav class="navbar">
            <div class="container col-md-12">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp"><img src="img/logo-white.png"
                    style="position:absolute; top:15px; left:15px; width:160px; height:60px;"/>
                    </a>
                    <a id="hone_hone_clock_bg"></a>
                    <a id="hone_hone_clock">
                        <script charset="Shift_JIS" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.js"></script>
                    </a>
                    <br/>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse-3">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar" style="background:white"></span>
                        <span class="icon-bar" style="background:white"></span>
                        <span class="icon-bar" style="background:white"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse-3">
                    <ul class="nav navbar-nav navbar-right" id="nav_list">
                        <li><a href="user_profile.jsp"><i class="fa fa-cog animated fadeInDown" style="color: #ffffff; font-size: 16px;"><b> My Profile</b></i></a></li>
                        <li><a href="contact.jsp"><i class="fa fa-phone animated fadeInDown" style="color: #ffffff; font-size: 16px;"><b> Contact</b></i></a></li>
                        <li><a href="main.jsp"><i class="fa fa-sign-out animated fadeInDown" style="color: #ffffff; font-size: 16px;"><b> Log Out</b></i></a></li>
                </ul>
                </div><!-- /.navbar-collapse -->
            </div>
            <div class="container col-md-12">
                <div class="col-md-10"></div>
                <div class="col-md-2">
                    <div class="input-group" style="padding-top: 20px;">
                        <input type="text" class="form-control" name="fuzzySearchBlog" form="home_control" placeholder="Search for blog posts or users..."/>
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="submit" name="fuzzySearchAction" value="Fuzzy Search" form="home_control" onclick="return SearchBlogValidate()"><i class="fa fa-search"></i></button>
                          </span>
                    </div><!-- /input-group -->
                </div>
            </div>
        </nav>
    </div>

    <div class="container-fluid"><br/><br/>
        <!-- <link rel="stylesheet"
               href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>-->

        <!--LEFT COLUMN, USERS LIST-->
        <div class="col-md-9">
            <form action="home.jsp" method="post">
                <!-- BLOG POSTS -->
                <div id="all_posts">
                    <%
                        int i=0;
                        for(Post post : postLinkedList) {
                            i++;
                            if(i>10)
                                break;
                    %>
                    <div class="row">
                        <div class="col-md-12">
                            <div id="post_list">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <div>
                                            <div class="row">
                                                <div>
                                                    <div class="col-sm-9"></div>
                                                    <div class="col-sm-3">
                                                        <h4 class="pull-right">
                                                            <small><em><%= post.getDate() %><br></em></small>
                                                        </h4>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="pull-center" style="text-align: center;">
                                                    <h3><strong><%= post.getTitle() %></strong></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <pre><%= post.getBody() %></pre>
                                        <%--<!-- COMMENT BOX -->
                                        <hr/>
                                        <div>
                                        <div><p>Comments:</p>
                                            <%for(Comment comment : commentLinkedList) {%>
                                            <%= comment.getCommentBody()%><br/><%}%>
                                            <hr/>
                                            <textarea name="commentBody" placeholder="Your Comment..." cols="60" rows="3" form="home_control"></textarea>
                                        &lt;%&ndash;<textarea name="commentBody_<%=i%>" placeholder="Your Comment..." cols="60" rows="3" form="home_control"></textarea>
                                        <input type="hidden" name="commentOfPostId_<%=i%>" value="<%=post.getId()%>" form="home_control"/>
                                        <%request.setAttribute("commentOfPostId_" + Integer.toString(i), post.getId());%>&ndash;%&gt;
                                            <p></p>
                                            <button style= "padding-top: -10px;" type="submit" name="sentCommentAction" value="Send Comment" form="home_control" class="btn btn-success green"><i class="fa fa-share"></i> Send</button>
                                        </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/><%}%>
                </div>


                <!-- BLOG EDITOR -->
                <div id="blog_editor" style="text-align:center;">
                    <div class="breath">line</div>
                    <table style="margin:auto;">
                        <tr><th>
                            <input type="text" class="form-control" name="blogTitle" id="blogTitle" form="home_control" placeholder="Title"/><b
                        </th></tr>
                        <tr><td>
                            <textarea name="blogBody" id="blogBody" cols="100" rows="20" form="home_control" placeholder="Write blog here..."></textarea><br/><br/>
                            <%--<textarea style="text-align: right" form="home_control"><%= currentUserName%></textarea></textarea><br/>
                            <script>
                                CKEDITOR.replace("blogBody");
                            </script>--%>
                        </td></tr>
                        <tr><td>
                            <button type="submit" name="sendBlogAction" value="Send This Blog" form="home_control" class="btn btn-primary" onclick="return SendBlogValidate()"><i class="fa fa-share"></i> Publish</button>
                        </td></tr>
                    </table>
                </div>
                <br/>
            </form>
        </div>

        <!-- RIGHT COLUMN, USER LIST, FLASH GAME -->
        <div class="col-md-3 animated bounceInRight">
            <div class="well" id="user_list">
                <h4>Welcome back, <%=currentUserName %>!</h4>
                <br/>
                <table>
                    <%
                        for(User user : userList) {
                            if(user.getUserType().equals("Administrator")){
                                continue;
                            }
                    %>
                    <tbody align="center" valign="middle">
                    <tr>
                        <td><%= user.getUserName() %></td>
                    </tr>
                    </tbody><%}%>
                </table>
            </div>
        </div>
    </div>

    <form action="/blog/HomeControl" method="post" name="home_control" id="home_control" onsubmit="return checkLength(this)">
        <%session.setAttribute("blogUserName", currentUserName);%>
        <!--
        <select name="category">
            <option value=""></option>
            <option value="life">life</option>
            <option value="education">education</option>
            <option value="animal">animal</option>
        </select>
        -->
    </form>

    <div class="breath size2" id="show_hamster">My Hamster</div>

    <a id="hamster">
        <object type="application/x-shockwave-flash" style="outline:none;"
                data="http://cdn.abowman.com/widgets/hamster/hamster.swf?" width="263"
                height="197"><param name="movie" value="http://cdn.abowman.com/widgets/hamster/hamster.swf?">
            <param name="AllowScriptAccess" value="always">
            <param name="wmode" value="opaque">
        </object>
    </a>

<script language="JavaScript">
    $(document).ready(function(){
        $("#show_hamster").click(function(){
            $("#hamster").toggle();
        });
    });

        /**
     * @return {boolean}
     */
    function SearchBlogValidate() {
            if (document.home_control.fuzzySearchBlog.value==""){
                alert("Nothing found!");
                document.home_control.fuzzySearchBlog.focus();
                return false;
            }
        }
        /**
     * @return {boolean}
     */
    function SendBlogValidate(){
            if (document.home_control.blogTitle.value==""){
                alert("Please enter a title!");
                document.home_control.blogTitle.focus();
                return false;
            }
        }
        /**
     * @return {boolean}
    */
/*    function SendCommentValidate(){
            if (document.home_control.commentBody.value==""){
                alert("Please enter comment!");
                document.home_control.commentBody.focus();
                return false;
            }
        }*/
    function checkLength(form){
        if (form.fuzzySearchBlog.value.length > 100){
            alert("Text too long. Must be 100 characters or less");
            return false;
        }
        /*if (form.commentBody.value.length > 200){
            alert("Text too long. Must be 200 characters or less");
            return false;
        }*/
        if (form.blogTitle.value.length > 100){
            alert("Text too long. Must be 100 characters or less");
            return false;
        }
        if (form.blogBody.value.length > 2000){
            alert("Text too long. Must be 2000 characters or less");
            return false;
        }
    }

</script>
</body>
</html>