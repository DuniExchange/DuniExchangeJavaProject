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
    <div class="d-flex flex-column bg-dark-gradient text-regular-lighter" id="general-container">
        <div>
            <div class="container border-container container-shadow bg-opaque-primary-marker" id="avatar-section">
                <div class="basic-container" id="avatar-display">
                    <div class="avatar-container">
                        <a href="${ACCOUNT.userAvatarURL}" class="avatar-link" aria-hidden="true">
                            <div class="avatar-border">
                                <img src="${ACCOUNT.userAvatarURL}" id="avatar-img">
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
                <div class="info-container border-container container-shadow col-12 bg-opaque-primary-marker">
                    <div class="info ml-5 px-3 py-2">
                        <span class="d-block mb-2">Gmail: <div class="gmail info-text">${ACCOUNT.userEmail}</div></span>
                        <span class="d-block mb-2">Facebook: <div class="phone info-text">${ACCOUNT.userFacebookURL}</div></span>
                        <button class="btn btn-primary col-12">Edit profile <i class="fas fa-pencil-alt"></i></button>
                    </div>
                </div>
            </div>
            
            <div class="basic-container col-8 py-3" id="function-display">
                <div class="function-container border-container container-shadow col-12 bg-opaque-primary-marker overflow-hidden">
                    <!--tab-->
                    <div class="tablinks px-4 py-3 d-flex" id="post-tablinks">
                        <div class="tablink py-2 mx-2 d-flex flex-column align-items-center" id="tab-post">
                            Posts 
                            <div class="tab-underline"></div>
                        </div>
                        <div class="tablink py-2 mx-2 d-flex flex-column align-items-center" id="tab-create">
                            Create
                            <div class="tab-underline"></div>
                        </div>                       
                    </div>
                    
                    <!--content-->
                    <div class="tabcontents d-flex" id="post-tabcontents">
                        
                        <div class="tabcontent col-6 p-3 d-flex flex-column overflow-auto" id="post">
                            <div>
                                <c:forEach items="${POST_LIST}" var="post">
                                    <c:if test="${not post.isDisable}">
                                        <div class="post d-flex bg-white-marker px-3 border-container mb-3" data-id="${post.postID}">
                                            <div class="imgp">
                                                <img src="${post.postThumbnailURL}" style="" alt="anh san pham">
                                            </div>
                                            <div class="contentp ms-3 flex-grow-1 d-flex flex-column">
                                                <a class="title text-hover" href="" style="font-size: 30px;font-weight: bold ;" title="${post.postTitle}">${post.postTitle}</a>
                                                <div class="date-n-author d-flex"><p class="date">${post.postDate} -</p> <a class="author ms-1" href="">${post.postUserFullname}</a></div>
                                                <div class="description pe-2"><p class="m-0">${post.postDescription}</p></div>
                                                <div class="post-button my-auto d-flex  justify-content-between">
                                                    <div class="like-progress d-flex">
                                                        <div class="icon-heart me-2"><i class="far fa-heart"></i></div>
                                                        <div>
                                                            <p class="m-0">${post.postLike}</p>
                                                        </div>
                                                    </div>
                                                    <div class="edit-n-delete d-flex">
                                                        <div class="edit-button me-2" data-bs-toggle="modal" data-bs-target="#edit-modal"><i class="far fa-edit text-hover"></i></div>
                                                        <div class="delete-button" data-s1="hello" data-s2="goodbye" data-bs-toggle="modal" data-bs-target="#delete-modal"><i class="far fa-trash-alt text-hover"></i></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    
                        <div class="tabcontent col-6 p-3" id="create">
                            <div class="form-container flex-fill">
                                <form method="post" enctype='multipart/form-data' id="create-post-form">
                                    <div class="title-container form-group input-container mb-2">
                                        <label for="create-title" class="create-label">Title:</label>
                                        <input type="text" name="title" id="create-title" class="form-control">                     
                                    </div>
                                    <div class="img-container form-group input-container mb-2">
                                        <label for="custom-file" class="create-label">Photo attached:</label>
                                        <div class="custom-file mb-2">
                                            <input accept="image/png, image/jpeg, image/bmp" type="file" name="img" id="create-img" class="preview-img-input" hidden multiple>
                                            <label class="btn btn-primary" for="create-img">Choose File</label>
                                        </div>
                                        <div class="upload-preview bg-white d-flex align-items-center justify-content-center">
                                            <div class="upload-icon"><i class="fad fa-upload"></i></div>
                                            <div class="preview d-flex" id="create-preview"></div>
                                        </div>
                                    </div>
                                    <div class="category-container form-group input-container mb-2">
                                        <label for="category-items" class="create-label">Category:</label>
                                        <div id="create-category-items" class="category-items d-flex flex-wrap">
                                            <c:forEach var="cat" items="${CATEGORY_LIST}" varStatus="count">  
                                                 <div class="category-item d-flex align-items-center">
                                                     <input type="checkbox" name="category" value="${cat.categoryID}" data-id="${cat.categoryID}" class="me-1">
                                                     <label for="category" style="max-width: 100px" class="text-truncate" title="${cat.categoryName}">${cat.categoryName}</label>
                                                 </div>
                                            </c:forEach> 
                                        </div>
                                    </div>
                                    <div class="description-container form-group input-container mb-2">
                                        <label for="create-description" class="create-label">Description:</label>
                                        <textarea name="description" id="create-description" class="form-control" rows="10" style="resize:none;"></textarea>
                                    </div>
                                    <input type="button" role="button" value="Đăng" class="mr-auto btn btn-primary" id="create-post-button">
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
        
    <!--   delete modal  -->
    <div class="modal fade" id="delete-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Do you want to delete this post?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              <button type="button" class="btn btn-primary" data-action="accept">Delete</button>
            </div>
          </div>
        </div>
    </div>
        
    <div class="modal fade" id="edit-modal" tabindex="-1" aria-labelledby="edit-modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"> 
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Edit</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="loading-placeholder">Loading...</div>
                
                <div class="form-container flex-fill">
                    <form method="post" enctype='multipart/form-data' id="edit-post-form">
                        <div class="title-container form-group input-container mb-2">
                            <label for="edit-title" class="edit-label">Title:</label>
                            <input type="text" name="title" id="edit-title" class="form-control">                     
                        </div>
                        <div class="img-container form-group input-container mb-2">
                            <label for="custom-file" class="edit-label">Photo attached:</label>
                            <div class="custom-file mb-2">
                                <input accept="image/png, image/jpeg, image/bmp" type="file" name="img" id="edit-img" class="preview-img-input" hidden multiple>
                                <label class="btn btn-primary" for="edit-img">Choose File</label>
                            </div>
                            <div class="upload-preview bg-white d-flex align-items-center justify-content-center">
                                <div class="upload-icon"><i class="fad fa-upload"></i></div>
                                <div class="preview d-flex" id="edit-preview"></div>
                            </div>
                        </div>
                        <div class="category-container form-group input-container mb-2">
                            <label for="category-items" class="edit-label">Category:</label>
                            <div id="edit-category-items" class="category-items d-flex flex-wrap">
                                <c:forEach var="cat" items="${CATEGORY_LIST}" varStatus="count">  
                                     <div class="category-item d-flex align-items-center">
                                         <input type="checkbox" name="category" value="${cat.categoryID}" class="me-1" data-id="${cat.categoryID}">
                                         <label for="category" style="max-width: 100px" class="text-truncate" title="${cat.categoryName}">${cat.categoryName}</label>
                                     </div>
                                </c:forEach> 
                            </div>
                        </div>
                        <div class="description-container form-group input-container mb-2">
                            <label for="edit-description" class="edit-label">Description:</label>
                            <textarea name="description" id="edit-description" class="form-control" rows="2" style="resize:none;"></textarea>
                        </div>                        
                    </form>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              <button type="button" class="btn btn-primary" data-action="accept">Save</button>
            </div>
          </div>
        </div>
    </div>    
  
    <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
  
    <script src="/DuniExchange/resource/js/tab-toggle.js"></script>
    <script src="/DuniExchange/resource/js/ajax-data-sender.js"></script>
    <script src="/DuniExchange/resource/js/my-account/my-account.js"></script>
    <script src="/DuniExchange/resource/js/my-account/upload-preview.js"></script>
    
    <script type="text/javascript">
        var isError = false;

        //add an error
        function insertError(container, msg){
            isError = true;
            console.log('insert error ', container);
            var font = document.createElement('font');                       
            font.innerHTML = msg;
            font.setAttribute("color", "red");
            font.setAttribute("class", "error-font");
            container.appendChild(font);
        }
        
        //destroy all error
        function destroyAllError(key){
            $(`#\${key}-post-form .error-font`).remove();
        }        
        //validate create post form
        function validate(key, config = {isCheckFile: true}){
            
            destroyAllError(key);
            isError = false; //set isError false first            
            let title = $(`#\${key}-title`);
            let img = $(`#\${key}-img`);
            let descr = $(`#\${key}-description`);
            let cat = $(`#\${key}-category-items input[type=checkbox]:checked`);
            
            if(title[0].value === "" || title[0].value === null){
                insertError($(`#\${key}-post-form .title-container`)[0], "Must fill this field");
            }

            if(config.isCheckFile){
                if(img[0].files.length === 0){
                    insertError($(`#\${key}-post-form .img-container`)[0], "Must choose file");     
                }
            }
            
            if(cat.length === 0){
                insertError($(`#\${key}-post-form .category-container`)[0], "Must choose at least a category");
            }
            
            if(descr[0].value === "" || descr[0].value === null){
                insertError($(`#\${key}-post-form .description-container`)[0], "Must fill this field");
            }

            return !isError;
        }
        
        //reset data in create post form after send request
        function clearForm(key){
            let title = $(`#\${key}-title`);
            let img = $(`#\${key}-img`);
            let descr = $(`#\${key}-description`);
            let cat = $(`#\${key}-category-items input[type=checkbox]:checked`);
            
            title.val('');
            img.val('');
            clearPreview();
            descr.val('');
            cat.each(function(){
                if(this.checked) this.checked = false;
            });
        }
    </script>
</body>

</html>
