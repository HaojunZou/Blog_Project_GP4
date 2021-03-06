package se.molk.blog.web.controller;

import se.molk.blog.dao.PostDAO;
import se.molk.blog.dao.UserDAO;
import se.molk.blog.domain.Post;
import se.molk.blog.domain.User;
import se.molk.blog.service.PostService;
import se.molk.blog.service.UserService;
import se.molk.blog.utils.TextFilter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminPanelControl")
public class AdminPanelControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        UserDAO user = null;
        PostDAO post = null;
        try {
            user = new UserDAO();
            post = new PostDAO();
        } catch (Exception e) {
            e.printStackTrace();
        }
        TextFilter textFilter = new TextFilter();
        UserService userService = new UserService(user);
        PostService postService = new PostService(post);
        String userSearchRecord = textFilter.filterHtml(request.getParameter("userSearchRecord"));
        String postSearchRecord = textFilter.filterHtml(request.getParameter("postSearchRecord"));
        String userSearchAction = request.getParameter("userSearchAction");
        String postSearchAction = request.getParameter("postSearchAction");
        List<User> users;
        List<Post> posts;
        try {
            if("User Search".equals(userSearchAction)){
                users = userService.getUserByFuzzySearch(userSearchRecord);
                request.setAttribute("users", users);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/admin_panel_result.jsp");
                dispatcher.forward(request, response);
            }
            if("Post Search".equals(postSearchAction)){
                posts = postService.getPostsByTitle(postSearchRecord);
                request.setAttribute("posts", posts);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/admin_panel_result.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
