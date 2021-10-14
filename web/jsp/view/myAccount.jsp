<%-- 
    Document   : home
    Created on : Oct 8, 2021, 6:10:39 PM
    Author     : Minky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
  <title>Document</title>
</head>

<body>
    <!-- header import -->
    <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
    <!-- header import -->
    
<!--main body-->
    <div class="d-flex flex-column bg-second" id="general-container">
        <div>
            <div class="avaname-container container border-container container-shadow bg-second-light" id="avatar-display">
                <div class="avatar-container">
                    <a href="/DuniExchange/resource/img/avatar/DE150357_HoHuuTinh.jpg" class="avatar-link" aria-hidden="true">
                        <div class="avatar-border">
                            <img src="/DuniExchange/resource/img/avatar/DE150357_HoHuuTinh.jpg" id="avatar-img">
                            <div class="avatar-mask"></div>
                        </div>
                    </a>
                </div>
                <div class="name-container d-flex ms-3">
                    <p class="avatar-name mt-auto mb-0">Hồ Hữu Tình</p>
                </div>
            </div>
        </div>

        <div class="d-flex container p-0 align-items-start" id="body-section">
            <div class="border-container container-shadow my-3 col-4 d-flex bg-second-light" id="information-display">
                <div class="my-auto col-12">
                    <div class="info ml-5 px-3 py-2">
                        <span class="d-block mb-2">Gmail: <div class="gmail info-text">minkyshinyu@gmail.com</div></span>
                        <span class="d-block mb-2">Address: <div class="address info-text"> Hoa Hai - Ngu Hanh Son </div></span>
                        <span class="d-block mb-2">Phone: <div class="phone info-text"> 0368569127 </div></span>
                        <button class="btn btn-light-primary col-12">Edit profile <i class="fas fa-pencil-alt"></i></button>
                    </div>
                </div>
            </div>
            <div class="border-container container-shadow my-3 ms-3 bg-second-light" id="function-display">
                <div class="post-container px-4 py-3 tab-shadow">
                    <!--tab-->
                    <div class="tabs d-flex">
                        <div class="tablinks py-2 mx-2 d-flex flex-column" id="tab-post">
                            Your Post 
                            <div class="tab-underline"></div>
                        </div>
                        <div class="tablinks py-2 mx-2 d-flex flex-column active" id="tab-create">
                            Upload Post
                            <div class="tab-underline"></div>
                        </div>                       
                    </div>
                    
                    <!--content-->
                    <div class="tabcontent d-flex mt-3 flex-column" id="post">
                        <div class="post d-flex bg-second px-3 border-container">
                            <div class="imgp">
                                <img src="https://dienmaythienhoa.vn/static/images/4.%20hinh%20sp/3.%20Hinh%20SP%202/laptop-asus-s330fn-ey037t-1.png" style="" alt="anh san pham">
                            </div>
                            <div class="contentp ms-3 flex-grow-1 d-flex flex-column">
                                <a class="title" href="" style="font-size: 30px;font-weight: bold ;"> laptop-asus-s330fn-ey037t-1</a>
                                <div class="date-n-author d-flex"><p class="date">Mon, 31/05/2021 -</p> <a class="author ms-1" href="">Uyen Trang</a></div>
                                <div class="decription"><p>CPU core i51135G7; Graphic card: Intel Iris XE; Ram 8GBzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzCPU core i51135G7; Graphic card: Intel Iris XE; Ram 8GBzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzCPU core i51135G7; Graphic card: Intel Iris XE; Ram 8GBzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzCPU core i51135G7; Graphic card: Intel Iris XE; Ram 8GBzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p></div>
                                <div class="like-progress d-flex mt-auto">
                                    <div class="icon-heart me-2"><i class="far fa-heart"></i></div>
                                    <div>
                                        <p class="m-0">NaN</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tabcontent" id="create">
                        <div id="form-container" class="form-container flex-fill text-light">
                            <form action="AddPostServlet" method="post" enctype='multipart/form-data' onsubmit="return validate()">
                                <div id="title-container" class="form-group input-container mb-2">
                                    <label for="title" class="create-label">Tiêu đề:</label>
                                    <input type="text" name="title" id="title" class="form-control">                                    
                                </div>
                                <div id="img-container" class="form-group input-container mb-2">
                                    <label for="custom-file" class="create-label">Ảnh đính kèm:</label>
                                    <div class="custom-file mb-2">
                                        <input accept="image/*" type="file" id="img" name="img" id="img" hidden multiple onchange="loadFile(event)">
                                        <label class="btn btn-primary" for="img">Choose File</label>
                                    </div>
                                    <div id="preview-upload" class="preview-upload"></div>
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
        <!-- footer import -->
          <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>
        <!-- footer import -->
    </div>
  
  <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
  
    <script type="text/javascript">
        var buttons = document.getElementsByClassName('tablinks');
        var contents = document.getElementsByClassName('tabcontent');
        function showContent(id) {
            if(id === null) return;
            $('.tabcontent').each(function(){
                var id = "#" + this.id;
                $(id).removeClass('d-flex');
                $(id).addClass('d-none');
            });
            $(id).toggleClass('d-none d-flex');
        }
        $('.tablinks').each(function(){
            console.log('add event for' + this.id);
            this.addEventListener("click", function () {
                var id = '#' + this.id.split("-")[1];
                for (var i = 0; i < buttons.length; i++) {
                    $('.tablinks').removeClass("active");
                }
                this.className += " active";
                showContent(id);
            });
        });
        showContent('#create');
    </script>
    
    <script type="text/javascript">
        var loadFile = function(event) {
            var preview = document.getElementById('preview-upload');
            preview.innerHTML = "";
            var files = event.target.files;
            var fileNames = "";
            var n = 0;

            if(files.length > 0){
                destroyError("img-container");
            } else {
                label.innerHTML = "Chọn tệp";
                return;
            }
            for(const file of files){
                n++;
                fileNames += '"' +  file.name + '"' + ', ';
                preview.innerHTML += '<img class="img-preview me-2" id="output-'+ n +'"></img>';
                var output = document.getElementById("output-" + n);
                output.src = URL.createObjectURL(file);
            }
            fileNames = fileNames.substring(0, fileNames.length-2);
            output.onload = function() {
               URL.revokeObjectURL(output.src); // free memory
            };
        };
    </script>
    
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
