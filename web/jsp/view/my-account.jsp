<%-- 
    Document   : home
    Created on : Oct 8, 2021, 6:10:39 PM
    Author     : Minky
--%>

<%@page import="DAO.User.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:set value="${sessionScope.currentAccount}" var="ACCOUNT"></c:set>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--  base css importing-->
  <jsp:include  page="/jsp/importer/base-css.jsp"></jsp:include>
  <!-- home css -->
  <link rel="stylesheet" href="/DuniExchange/resource/css/my-account.css">
  <title>${ACCOUNT.userFullname} | DuniExchange</title>
</head>

<body>    
    <!-- header import -->
    <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
    <!-- header import -->
    
<!--main body-->
    <div class="d-flex flex-column bg-primary-gradient text-regular" id="general-container">
        <div>
            <div class="container border-container container-shadow bg-opaque-primary" id="avatar-section">
                <div class="basic-container" id="avatar-display">
                    <div class="avatar-container">
                        <a href="/DuniExchange/resource/img/avatar/minky.png" class="avatar-link" aria-hidden="true">
                            <div class="avatar-border">
                                <img src="/DuniExchange/resource/img/avatar/minky.png" id="avatar-img">
                                <div class="avatar-mask"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="basic-container" id="name-display">
                    <div class="name-container d-flex ms-3">
                        <p class="avatar-name mt-auto mb-0">${ACCOUNT.userFullname}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex container p-0 align-items-start" id="body-section">

            <div class="basic-container col-4 pt-3 pe-3 d-flex" id="information-display">
                <div class="info-container border-container container-shadow col-12 bg-opaque-primary">
                    <div class="info ml-5 px-3 py-2">
                        <span class="d-block mb-2">Gmail: <div class="gmail info-text">${ACCOUNT.userEmail}</div></span>
                        <span class="d-block mb-2">Facebook: <div class="phone info-text">${ACCOUNT.userFacebookURL}</div></span>
                        <button class="btn btn-primary col-12">Edit profile <i class="fas fa-pencil-alt"></i></button>
                    </div>
                </div>
            </div>
            
            <div class="basic-container col-8 py-3" id="function-display">
                <div class="function-container border-container container-shadow col-12 bg-opaque-primary overflow-hidden">
                    <!--tab-->
                    <div class="tablinks px-4 py-3 d-flex" id="post-tablinks">
                        <div class="tablink py-2 mx-2 d-flex flex-column" id="tab-post">
                            Your Post 
                            <div class="tab-underline"></div>
                        </div>
                        <div class="tablink py-2 mx-2 d-flex flex-column" id="tab-create">
                            Upload Post
                            <div class="tab-underline"></div>
                        </div>                       
                    </div>
                    
                    <!--content-->
                    <div class="tabcontents d-flex" id="post-tabcontents">
                        
                        <div class="tabcontent col-6 p-3 d-flex flex-column overflow-auto" id="post">
                            <div>
                                <c:forEach items="${POSTLIST}" var="post">
                                    <div class="post d-flex bg-primary px-3 border-container mb-3">
                                        <div class="imgp">
                                            <img src="${post.postThumbnailURL}" style="" alt="anh san pham">
                                        </div>
                                        <div class="contentp ms-3 flex-grow-1 d-flex flex-column">
                                            <a class="title" href="" style="font-size: 30px;font-weight: bold ;">${post.postTitle}</a>
                                            <div class="date-n-author d-flex"><p class="date">Mon, 31/05/2021 -</p> <a class="author ms-1" href="">${post.postUserFullname}</a></div>
                                            <div class="decription pe-2"><p class="m-0">${post.postDescription}</p></div>
                                            <div class="like-progress d-flex my-auto">
                                                <div class="icon-heart me-2"><i class="far fa-heart"></i></div>
                                                <div>
                                                    <p class="m-0">${post.postLike}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    
                        <div class="tabcontent col-6 p-3" id="create">
                            <div id="form-container" class="form-container flex-fill">
                                <form action="AddPostServlet" method="post" enctype='multipart/form-data' onsubmit="return validate()">
                                    <div id="title-container" class="form-group input-container mb-2">
                                        <label for="title" class="create-label">Tiêu đề:</label>
                                        <input type="text" name="title" id="title" class="form-control">                                    
                                    </div>
                                    <div id="img-container" class="form-group input-container mb-2">
                                        <label for="custom-file" class="create-label">Ảnh đính kèm:</label>
                                        <div class="custom-file mb-2">
                                            <input accept="image/*" type="file" name="img" id="img" hidden multiple>
                                            <label class="btn btn-primary" for="img">Choose File</label>
                                        </div>
                                        <div class="upload-preview bg-white">
                                            <div class="upload-icon"><i class="fad fa-upload"></i></div>
                                            <div class="preview d-flex" id="preview"></div>
                                        </div>
                                    </div>
                                    <div id="category-container" class="form-group input-container mb-2">
                                        <label for="category-items" class="create-label">Phân loại:</label>
                                        <div id="category-items" class="category-items d-flex flex-wrap">
    <%--                                        <sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                                url="jdbc:sqlserver://localhost:1433;databaseName=DuniExchange"  
                                                user="sa"  password="admin"/>  
                                            <sql:query dataSource="${db}" var="rs">  
                                            select * from Category;  
                                            </sql:query>
                                            <c:forEach var="cat" items="${rs.rows}" varStatus="count">  
                                                <div id="category-item-${count.index + 1}" class="category-item">
                                                    <label for="category">${cat.categoryName}</label>
                                                    <input type="checkbox" name="category" value="${cat.categoryID}">
                                                </div>
                                            </c:forEach> --%>

                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                                <div id="category-item-0" class="category-item me-5">
                                                    <label for="category">category-1</label>
                                                    <input type="checkbox" name="category" value="category-1">
                                                </div>
                                        </div>
                                    </div>
                                    <div id="decription-container" class="form-group input-container mb-2">
                                        <label for="decription" class="create-label">Mô tả:</label>
                                        <textarea name="decription" id="decription" class="form-control" rows="10" style="resize:none;"></textarea>
                                    </div>
                                    <input type="submit" value="Đăng" class="mr-auto btn btn-primary">
                                </form>
                            </div>
                        </div>
                    </div>
                </div> 
            </div> 
        </div>
        <!-- footer import -->
          <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>
        <!-- footer import -->
    </div>
  
  <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
  
    <script src="/DuniExchange/resource/js/tab-toggle.js"></script>
    <script>addTabToggleEvent('post');</script>
    <script src="/DuniExchange/resource/js/upload.js"></script>
    
    <script type="text/javascript">
        var isError = false;

        function insertError(container, msg){
            isError = true;
            console.log(container.getAttribute("id"));
            var font = document.createElement('font');                       
            font.innerHTML = msg;
            font.setAttribute("color", "red");
            font.setAttribute("id", container.id +"-error");
            container.appendChild(font);
        }

        function destroyError(containerID){
            var container = document.getElementById(containerID);

            console.log("container: " + container.id);

            var error = document.getElementById(container.id + "-error");
            if(error === null) return;
            console.log("remove " + error.id + " at "  + container.tagName + " id="+ container.id);
            container.removeChild(error);
        }

        function destroyAllError(){
            var inputContainers = document.getElementsByClassName("input-container");

            console.log("eLen: " + inputContainers.length);

            for(const ip of inputContainers){
                var error = document.getElementById(ip.id + "-error");
                if(error === null) continue;
                console.log("remove " + error.id + " at "  + ip.tagName + " id="+ ip.id);
                ip.removeChild(error);
            }
        }

        function validate(){
            destroyAllError();
            isError = false;
            var title = document.getElementById("title");
            var img = document.getElementById("img");
            var descr = document.getElementById("decription");

            if(title.value === "" || title.value === null){
                insertError(document.getElementById("title-container"), "Must fill this field");
            }

            if(img.files.length === 0){
                insertError(document.getElementById("img-container"), "Must choose file");
            }

            if(descr.value === "" || descr.value === null){
                insertError(document.getElementById("decription-container"), "Must fill this field");
            }

            return !isError;
        }
    </script>
</body>

</html>
