<%
    LinkedList<User> userList;
    LinkedList<Post> postLinkedList;
    LinkedList<Post> resultPostsList;
    String currentUserName = (String) session.getAttribute("currentUserName");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="se.molk.blog.domain.Comment" %>
<%@ page import="se.molk.blog.domain.Post" %>
<%@ page import="se.molk.blog.domain.User" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            background-color: #a9bcf5;
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
    </style>

</head>
<body>

<div class="container-fluid">
    <nav class="navbar">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="home.jsp"><img src="img/logo-white.png"
                                                             style="position:absolute; top:5px; left:5px; width:160px; height:60px;"/>
                </a><br/>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#navbar-collapse-3">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar" style="background:white"></span>
                    <span class="icon-bar" style="background:white"></span>
                    <span class="icon-bar" style="background:white"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="navbar-collapse-3">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="user_update_profile.jsp"><i class="fa fa-cog animated fadeInDown"><b> Config my profile</b></i></a></li>
                    <li><a href="user_change_pwd.jsp"><i class="fa fa-eye animated fadeInDown"><b> Change Password</b></i></a></li>
                    <li><a href="#"><i class="fa fa-phone animated fadeInDown"><b> Contact</b></i></a></li>
                    <li><a href="main.jsp"><i class="fa fa-sign-out animated fadeInDown"><b> Log Out</b></i></a></li>
                </ul>

            </div>
            <!-- /.navbar-collapse -->
            <div class="col-md-9"></div>
            <div class="inner-addon right-addon col-md-3">
                <i class="glyphicon glyphicon-search"></i>
                <input type="text" class="form-control" name="fuzzySearchBlog" form="home_control" placeholder="Search" onsubmit="return SearchValidate()"/>
            </div>
        </div>
        <!-- /.container -->
    </nav>
    <!-- /.navbar -->

    <div class="container-fluid "><br/><br/>
        <link rel="stylesheet"
              href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>

        <!--LEFT COLUMN, USERS LIST-->
        <form action="home.jsp" method="post">
            <div class="container col-md-3 animated bounceInLeft">
                <div class="well" id="userList">
                    <%
                        userList = (LinkedList<User>)session.getAttribute("users");
                        if(userList == null){
                            userList = new LinkedList<User>();
                        }
                    %>
                    <h1>Welcome back, <%=currentUserName %>!</h1>
                    <table>
                        <tr>
                            <th>User List:</th>
                        </tr>
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

            <div class="container col-md-6">
                <!-- BLOG POSTS -->
                <div id="all_posts">
                    <%
                        postLinkedList = (LinkedList<Post>)request.getAttribute("posts");
                        if(postLinkedList == null){
                            postLinkedList = new LinkedList<Post>();
                        }
                        LinkedList<Comment> commentLinkedList = (LinkedList<Comment>)request.getAttribute("comments");
                        if(commentLinkedList == null){
                            commentLinkedList = new LinkedList<Comment>();
                        }
                        int i=0;
                        for(Post post : postLinkedList) {
                            i++;
                            if(i>10)
                                break;
                    %>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div id="postlist">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="text-center">
                                                <div class="row">
                                                    <div class="col-sm-9">
                                                        <h3 class="pull-left"><th><%= post.getTitle() %></th></h3>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <h4 class="pull-right">
                                                            <small><em><%= post.getDate() %><br></em></small>
                                                        </h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <%= post.getBody() %>
                                            <!-- COMMENT BOX -->
                                            <hr/>
                                            <div>
                                                <div>
                                                    <%for(Comment comment : commentLinkedList) {%>
                                                    <%= comment.getCommentBody()%><br/><%}%>
                                                    <hr/>
                                                    <input type="text" name="commentBody" placeholder="Your Comment..." size="35" form="home_control"/><p></p>
                                                    <input type="submit" name="commentPost" value="Send Comment" form="home_control"/>
                                                </div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/><%}%>
                </div>

                <!-- USERS BLOG POSTS -->
                <div id="result_all_posts">
                    <%
                        resultPostsList = (LinkedList<Post>)request.getAttribute("resultPosts");
                        if(resultPostsList == null){
                            resultPostsList = new LinkedList<Post>();
                        }
                        int j=0;
                        for(Post post : resultPostsList) {
                            j++;
                            if(j>10)
                                break;
                    %>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div id="userPostlist">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="text-center">
                                                <div class="row">
                                                    <div class="col-sm-9">
                                                        <h3 class="pull-left"><th><%= post.getTitle() %></th></h3>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <h4 class="pull-right">
                                                            <small><em><%= post.getDate() %><br></em></small>
                                                        </h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <%= post.getBody() %>
                                            <div>
                                                <%for(Comment comment : commentLinkedList) {%>
                                                <%= comment.getCommentBody()%><br/><%}%>
                                                <hr/>
                                                <input type="text" name="commentBody" placeholder="Your Comment..." size="35" form="home_control"/><p></p>
                                                <input type="submit" name="commentPost" value="Send Comment" form="home_control"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/><%}%>
                    <br/><br/>
                </div>

                <div>
                    <input type="text" class="form-control" name="title" id="title" form="home_control" placeholder="Title"/><br/>
                    <textarea name="body" form="home_control">Write blog here...<br/><br/><br/>
                        <textarea style="text-align: right" form="home_control"><%= currentUserName%></textarea></textarea><br/>
                    <script>
                        CKEDITOR.replace("body");
                    </script>
                    <input type="submit" name="sendBlog" value="Send This Blog" form="home_control"/>
                </div>
            </div>
        </form>
        <br/><br/><br/><br/>

        <form action="/blog/HomeControl" method="post" name="home_control" id="home_control">
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
        <!--RIGHT COLUMN, CHOOSE BLOG POST BY DATE -->
        <div class="container col-md-3 animated bounceInRight">
            <b>Date:</b><br/>
            <input type="date" name="date"/>
            <br/><br/><br/>
            <object type="application/x-shockwave-flash" style="outline:none;"
                    data="http://cdn.abowman.com/widgets/hamster/hamster.swf?" width="300"
                    height="225"><param name="movie" value="http://cdn.abowman.com/widgets/hamster/hamster.swf?">
                <param name="AllowScriptAccess" value="always">
                <param name="wmode" value="opaque">
            </object>
        </div>
    </div>
</div>

<script language="JavaScript">
    function SearchValidate() {
        if (document.home_control.fuzzySearchBlog.value==""){
            alert("Please enter a value to delete a post!");
            document.home_control.fuzzySearchBlog.focus();
            return false;
        }else{
            $("#result_all_posts").show();
            $("#all_posts").hide();
            return true;
        }
    }

</script>
</body>
</html>