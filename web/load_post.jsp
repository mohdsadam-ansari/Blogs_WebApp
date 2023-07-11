<%@page import="com.technical.blog.entities.User"%>
<%@page import="com.technical.blog.dao.LikeDao"%>
<%@page import="com.technical.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.technical.blog.entities.Category"%>
<%@page import="com.technical.blog.helper.ConnectionProvider"%>
<%@page import="com.technical.blog.dao.PostDao"%>

<div class="row">
    


<% 
    PostDao postDao=new PostDao(ConnectionProvider.getConnecton());
    List<Post> list=null;
    int id=Integer.parseInt(request.getParameter("cid"));
    if(id==0){
             list=postDao.getAllPosts();
    }else{
        list=postDao.getPostByCategory(id);
    }
    if(list.size()==0){
        out.println("<h3 class='display-3 text-center'>No Posts available in this category..</h3>");
    }
     for(Post p:list){
    
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle() %></b>
                <p><%=p.getpContent() %></p>                
            </div>
            <div class="card-footer primary-background text-center">
                <% LikeDao ld=new LikeDao(ConnectionProvider.getConnecton());
                        
                        %>
                
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLike(p.getpId())%></span></i></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-light btn-sm">Read More...</a>
            </div>
        </div>
    </div> 
    
    <%
        }
%>
</div>