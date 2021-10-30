<%-- 
    Document   : allProduct
    Created on : Oct 22, 2021, 3:23:20 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--  base css importing-->
        <jsp:include  page="/jsp/importer/base-css.jsp"></jsp:include>
            <!-- allProduct css -->
            <link rel="stylesheet" href="/DuniExchange/resource/css/all-product.css">
            <!--<link rel="stylesheet" href="/DuniExchange/resource/css/home.css">-->
            <title>All Product</title>
        </head>
        <body>
            <!-- header import -->
        <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
            <!-- header import -->
            <!-- end header -->

            <!-- Page content start -->
            <!-- <div class="container-fluid mt-5 pt-5 p-0">
              <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">Enable both scrolling & backdrop</button>
          
                  <div class="row">
                      <aside class="col-lg-4 col-xl-3 px-3 px-xl-4 px-xxl-5 pt-lg-2 shadow-sm">
                          <div class="offcanvas offcanvas-start offcanvas-collapse" style="width: 300px !important"  id="offcanvasWithBothOptions">
                          <div class="offcanvas offcanvas-start offcanvas-collapse" style="width: 300px !important" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
                              <div class="offcanvas-header">
                                <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Backdroped with scrolling</h5>
                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                              </div>
                              <div class="offcanvas-body">
                                <p>Try scrolling the rest of the page to see this option in action.</p>
                              </div>
                            </div>
                      </aside>
                  </div>
          
              </div> -->
            <section class="container-fluid mt-5 pt-5">
                <div class="row">
                    <aside class="col-lg-3 col-md-4 d-none d-md-flex px-3 px-xl-4 px-xxl-5 pt-lg-2 justify-content-center"
                           style="background-color: #fff;">
                        <div class="position-fixed">
                            <ul class="aside-header-list pt-4 ">
                                <li class="aside-header-item" onclick="window.location.href = 'DisplayAllProduct'">
                                    <div class="aside-header-item-cover active-aside-header">
                                        <span><i class="far fa-barcode-read"></i></span>
                                        <span> All Product</span>
                                    </div>
                                </li>
                                <li class="aside-header-item" onclick="window.location.href = 'DisplayAllProductExchange'">
                                    <div class="aside-header-item-cover aside-hover">
                                        <span><i class="far fa-handshake"></i></span>
                                        <span> Exchanged Product</span>
                                    </div>
                                </li>
                            </ul>
                            <hr class="dropdown-divider" style="color: var(--text-sub-color) !important;">
                            <div class="pt-4 ">
                                <h3 class="aside-category-type">Category type</h3>
                            <c:forEach items="${listC}" var="c">
                                <ul class="aside-category-list">

                                    <li class="aside-category-item">
                                        <a href="DisplayAllProductByCategory?caid=${c.categoryID} ${tag == c.categoryID ? " active":""}">
                                            <span class="aside-category-icon"><i class="${c.categoryIcon}"></i></span>
                                            <span class="aside-category-title">${c.categoryName}</span>
                                        </a>
                                    </li>

                                </ul>
                            </c:forEach>
                        </div>
                    </div>

                </aside>
                <!-- All Product -->
                <div class="col-lg-9 col-md-8 overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5" style="flex:1">
                    <nav class="breadcrumb mb-3 pt-md-2">
                        <ol class="breadcrumb-list">
                            <li class="breadcrumb-items breadcrumb-prev"><a href="DisplayHomeServlet">Home</a></li>
                            <span><i class="far fa-chevron-right"></i></span>
                            <li class="breadcrumb-items breadcrumb-current"><a href="DisplayAllProduct">All Product</a></li>
                        </ol>
                    </nav>
                    <div class="pb-3 pb-sm-4">
                        <h2 class="mb-sm-0 all-product-title">Find items to exchange</h2>
                    </div>
                    <div class="sort d-flex mb-lg-4 mb-2">
                        <div class="d-flex justify-content-center align-items-center">
                            <div class="sort-by pe-1 me-2">
                                <span><i class="far fa-sort-alt"></i></span>
                                <span>Sort by: </span>
                            </div>
                            <div>

                                <select onchange="location = this.value" class="form-select form-all-product " aria-label="Default select example">
                                    <option value="" selected>Newest</option>
                                    <option value="">Oldest</option>
                                    <option value="">Most Like</option>
                                    <option value="">Most View</option>
                                    <option value="">Most Engagement</option>
                                </select>
                            </div>
                        </div>
                        <hr style="flex:1" class="d-none d-sm-block mx-4" style="height: 1px; width: 100%;">
                        <div class="d-flex justify-content-center align-items-center result-all-product">
                            <span><i class="far fa-check-circle me-2"></i></span>
                            <span>${numberItem}</span>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${listPost_Account}" var="o">
                            <div class="col-lg-4 col-sm-6 mb-4 latest-post-product">
                                <div class="latest-post-img-cover">
                                    <!-- <img src="resource/img/product-img/dam-ngu-tre-em.jpg" alt="" class="img-fluid"> -->
                                    <div class="all-product-img"
                                         style="background:linear-gradient(to bottom, rgba(37, 37, 37, 0) 75%, rgb(37, 37, 37)), url('${o.postThumbnailURL}');">
                                    </div>
                                    <a href="#"><button class="like-button btn">
                                            <span style="margin-top: 2px;">
                                                <i class="far fa-heart"></i>
                                            </span>
                                        </button>
                                    </a>
                                    <div class="position-absolute" style="left: 20px; top: 22.5px">
                                        <a href="#" class="badge badge-primary" data-bs-toggle="modal" data-bs-target="#exchangeModal">Exchange now</a>
                                    </div>
                                    <ul class="list-description-absolute">
                                        <li class="list-description-item">
                                            <span><i class="far fa-heart"></i></span>
                                            <span>${o.postLike}</span>
                                        </li>
                                        <li class="list-description-item">
                                            <span><i class="far fa-comment-alt-dots"></i></span>
                                            <span>578</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="latest-product-content">
                                    <a href="ProductDetail?postid=${o.postID}">
                                    <h3 class="latest-post-title mt-2 mb-0" ><span class="latest-post-username">${o.userFullname}</span> muốn đổi
                                        <span class="latest-post-product-name"></span> ${o.postTitle}
                                    </h3>
                                    </a>
                                    <p class="latest-post-description">${o.postDescription}
                                    </p>
                                    <div class="d-flex mt-2 justify-content-md-center justify-content-around">
                                        <div class="all-product-user me-lg-4 me-2 d-flex align-items-center">
                                            <div>
                                                <div class="text-center"><img style="border-radius: 50%; object-fit: cover;"
                                                                              src="${o.userImage}" alt="" width="40px" height="40px">
                                                </div>
                                                <div class="text-center">${o.userFullname}</div>
                                            </div>
                                        </div>
                                        <ul class="list-description d-flex  align-items-center">
                                            <div>
                                                <div>
                                                    <li class="list-description-item">
                                                        <span><i class="far fa-eye"></i></span>
                                                        <span>348</span>
                                                    </li>
                                                    <li class="list-description-item">
                                                        <span><i class="far fa-clock"></i></span>
                                                        <span>15 minutes ago</span>
                                                    </li>
                                                </div>
                                            </div>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade" id="exchangeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">CHOOSE AN ITEM TO EXCHANGE</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-4 d-flex align-items-center ">
                            <div class="col-5">
                                <div class="modal-item-img">
                                    <img src="resource/img/product-img/xinhDep.jpeg" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="latest-post-title">Váy ngủ trẻ em xinh xắn</div>
                                <div class="latest-post-description">Chiếc váy trẻ em còn rất mới, phù hợp với mọi lứa tuổi, nay tôi muốn
                                    đổi </div>
                                <ul class="list-description">
                                    <li class="list-description-item">
                                        <span><i class="far fa-eye"></i></span>
                                        <span>348</span>
                                    </li>
                                    <li class="list-description-item">
                                        <span><i class="far fa-clock"></i></span>
                                        <span>15 minutes ago</span>
                                    </li>
                                    <li class="list-description-item">
                                        <span><i class="far fa-heart"></i></span>
                                        <span>348</span>
                                    </li>
                                    <li class="list-description-item">
                                        <span><i class="far fa-comment-alt-dots"></i></span>
                                        <span>578</span>
                                    </li>
                                </ul>
                                <div class="mt-2">
                                    <button class="btn btn-primary">Exchange this item</button>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-4 d-flex align-items-center ">
                            <div class="col-5">
                                <div class="modal-item-img">
                                    <img src="resource/img/product-img/xinhDep.jpeg" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="latest-post-title">Váy ngủ trẻ em xinh xắn</div>
                                <div class="latest-post-description">Chiếc váy trẻ em còn rất mới, phù hợp với mọi lứa tuổi, nay tôi muốn
                                    đổi </div>
                                <ul class="list-description">
                                    <li class="list-description-item">
                                        <span><i class="far fa-eye"></i></span>
                                        <span>348</span>
                                    </li>
                                    <li class="list-description-item">
                                        <span><i class="far fa-clock"></i></span>
                                        <span>15 minutes ago</span>
                                    </li>
                                    <li class="list-description-item">
                                        <span><i class="far fa-heart"></i></span>
                                        <span>348</span>
                                    </li>
                                    <li class="list-description-item">
                                        <span><i class="far fa-comment-alt-dots"></i></span>
                                        <span>578</span>
                                    </li>
                                </ul>
                                <div class="mt-2">
                                    <button class="btn btn-primary">Exchange this item</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>       
        <!-- footer import -->
        <%--<jsp:include page="/jsp/importer/footer.jsp"></jsp:include>--%>
        <!-- footer import -->
        <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
    </body>
</html>
