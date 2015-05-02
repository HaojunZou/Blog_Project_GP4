<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://" +request.getServerName()+":"+request.getServerPort()+path+"/" ;
%>
<base href="<%=basePath%>" >
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>Home</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    </head>
    <body background="img/bg.jpg"/>

        <div class="container-fluid">
            <nav class="navbar" >
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header" >
                        <a class="navbar-brand" style="font-size:40" href="img/logo-white.png"><img src="img/logo-white.png"
                            style="position:absolute; top:5px; left:5px; width:160px; height:60px;"/>
                        </a><br/>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-3">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar" style="background:white"></span>
                            <span class="icon-bar" style="background:white"></span>
                            <span class="icon-bar" style="background:white"></span>
                        </button>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-collapse-3">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="home.jsp"><i class="fa fa-home"><b> Home</b></i></a></li>
                            <li><a href="contact.html"><i class="fa fa-phone"><b> Contact</b></i></a></li>
                            <li><a href="main.html"><i class="fa fa-sign-out"><b> Log Out</b></i></a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container -->
            </nav><!-- /.navbar -->


            <div class="container-fluid " align="center"><br/><br/>
                <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>

                <!--LEFT COLUMN-->
                <div class="container col-md-3">
                    <div class="well">
                        <div class="media">
                            <a href="#">
                                <img class="media-object" src="img/profile1.jpg">
                            </a>
                        </div>
                    </div>
                </div>

                <!--POSTS-->
                <div class="container col-md-6">
                    <div class="well">
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="img/profile1.jpg">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Receta 1</h4>
                                <p class="text-right">By Francisco</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate.
                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis
                                    dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan.
                                    Aliquam in felis sit amet augue.</p>
                                <ul class="list-inline list-unstyled">
                                    <li><span><i class="glyphicon glyphicon-calendar"></i> 2 days, 8 hours </span></li>
                                    <li>|</li>
                                    <span><i class="glyphicon glyphicon-comment"></i> 2 comments</span>
                                    <li>|</li>
                                    <li>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                    </li>
                                    <li>|</li>
                                    <li>
                                        <!-- Use Font Awesome http://fortawesome.github.io/Font-Awesome/ -->
                                        <span><i class="fa fa-facebook-square"></i></span>
                                        <span><i class="fa fa-twitter-square"></i></span>
                                        <span><i class="fa fa-google-plus-square"></i></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="well">
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="img/profile2.png">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Receta 2</h4>
                                <p class="text-right">By Anailuj</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate.
                                    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis
                                    dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan.
                                    Aliquam in felis sit amet augue.</p>
                                <ul class="list-inline list-unstyled">
                                    <li><span><i class="glyphicon glyphicon-calendar"></i> 2 days, 8 hours </span></li>
                                    <li>|</li>
                                    <span><i class="glyphicon glyphicon-comment"></i> 2 comments</span>
                                    <li>|</li>
                                    <li>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star"></span>
                                        <span class="glyphicon glyphicon-star-empty"></span>
                                    </li>
                                    <li>|</li>
                                    <li>
                                        <!-- Use Font Awesome http://fortawesome.github.io/Font-Awesome/ -->
                                        <span><i class="fa fa-facebook-square"></i></span>
                                        <span><i class="fa fa-twitter-square"></i></span>
                                        <span><i class="fa fa-google-plus-square"></i></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!--RIGHT COLUMN-->
                <div class="container col-md-3">
                    <div class="well">
                        <div class="media">
                            <a href="#">
                                <img class="media-object" src="img/profile1.jpg">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>