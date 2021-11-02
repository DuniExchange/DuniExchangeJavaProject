<%-- 
    Document   : header
    Created on : Oct 8, 2021, 7:24:09 PM
    Author     : Minky
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/DuniExchange"><img style="width: 160px; height: auto" src="/DuniExchange/resource/img/logo.png"
                                                          alt="DuniExchange Logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item ">
                    <a class="nav-link header-text header-text--active" aria-current="page" href="#">Home Page</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link header-text" href="DisplayAllProduct">All Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link header-text" href="#">Exchanged Product</a>
                </li>
                <!-- <li class="nav-item dropdown" >
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                      </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="overflow-y: scroll;">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
      
                      </ul>
                    </li> -->
                <!-- <li class="nav-item">
                      <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li> -->
                <li class="nav-item">
                    <a class="nav-link header-text" href="#">About Us</a>
                </li>
            </ul>
            <form class="d-flex" action="#">
                <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>


            <c:if test="${not empty currentAccount}">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <div class="d-inline-flex align-items-center" style="height: 100%;">
                            <a class="nav-link px-0 py-0 ms-lg-4 me-lg-2 mt-lg-0 mb-lg-0 ms-0 mt-3 mb-2" href="#" id="navbarDropdown"
                               role="button">
                                <!-- <i class="fas fa-bell-on  fa-lg"></i> -->
                                <!-- <i class="fal fa-bell fa-lg"></i> -->
                                <span class="bell-hover d-none" style="color: var(--primary-color);">
                                    <i class="fas fa-bell-on fa-lg"></i>
                                </span>
                                 <c:if test="${Isseen == true}">
                                     <span class="bell-normal" style="color: var(--text-color);">                                   
                                    <i class="fal fa-bell fa-lg"></i>
                                    </span>
                                </c:if>
                                <c:if test="${Isseen == false}">
                                     <span class="bell-normal" style="color: var(--primary-color)">                                   
                                    <i class="fas fa-bell-on fa-lg"></i>
                                    </span>
                                </c:if>
                                
                            </a>
                        </div>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <div class="dropdown-item notification-text-name">
                                <h3 class="mb-0">Notifications</h3>
                            </div>
                            <div class="dropdown-divider w-75 ms-auto me-auto"
                                 style="background-color: var(--text-color) !important;"></div>
                            <c:forEach items="${getListNotificationByUserID}" var="o">
                                <c:if test="${o.notiType == -1}">
                                    <!-- request exchange and chờ xử lý -->
                                    <c:if test="${o.seen == 0}">
                                        <li class="dropdown-item-noti not-seen"><a class="dropdown-item" href="#">
                                    </c:if>
                                    <c:if test="${o.seen == 1}">
                                        <li class="dropdown-item-noti"><a class="dropdown-item" href="#">
                                    </c:if>
                                    <c:if test="${o.expired == 1}"><div class="disable-text" onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'"></c:if>
                                    <c:if test="${o.expired == 0}"><div class="" onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'"></c:if>
                                                <span class="normal"> You requested to exchange </span>
                                                <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.firstPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                                <span class="normal"> for </span>
                                                <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.secondPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>                                               
                                                <span class="normal"> with</span>
                                                <c:forEach items="${listUserAccount}" var="i">
                                                    <c:if test="${o.toUserID == i.userID}">
                                                        <span class="dropdown-item-noti-username">${i.userFullname}</span>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${o.expired == 0}"> <span class="badge bg-info">Waiting...</span></c:if>
                                               <c:if test="${o.expired == 1}"> <span class="badge bg-info disabled" >Waiting Expired</span></c:if>
                                            </div>
                                            <div class="time-request">1 minutes ago</div>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${o.notiType == 0}">
                                    <!-- thông báo request sản phẩm đổi -->
                                    <c:if test="${o.seen == 0}">
                                        <li class="dropdown-item-noti not-seen"><a class="dropdown-item" href="#" style="z-index: 1;">
                                    </c:if>
                                    <c:if test="${o.seen == 1}">
                                        <li class="dropdown-item-noti"><a class="dropdown-item" href="#" style="z-index: 1;">
                                    </c:if>
                                    <c:if test="${o.expired == 0}"><div class=""
                                                 onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'"></c:if>
                                    <c:if test="${o.expired == 1}"><div class="disable-text"
                                                 onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'"></c:if>
                                                <c:forEach items="${listUserAccount}" var="i">
                                                    <c:if test="${o.toUserID == i.userID}">
                                                        <span class="dropdown-item-noti-username">${i.userFullname}</span>
                                                    </c:if>
                                                </c:forEach>
                                                <span class="normal"> wants to exchange </span>
                                                <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.secondPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach> 
                                                <span class="normal"> for </span>
                                                <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.firstPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                                <span class="normal"> with you.</span>
                                            </div>
                                            <div class="time-request"
                                                 onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'">10 hours
                                                ago</div>
                                                 <c:if test="${o.expired == 1}">
                                                     <div class="mt-2">
                                                        <button type="button" class="btn btn-warning btn-sm" disabled>Request Expired</button>
                                                    </div>
                                                 </c:if>
                                                 <c:if test="${o.expired == 0}">
                                                     <div class="mt-2">
                                                        <button type="button" onclick="window.location.href = 'AcceptExchangeServlet?firstPostID=${o.secondPostID}&secondPostID=${o.firstPostID}'"
                                                        class="btn btn-success btn-sm">Accept Exchange</button>
                                                        <button type="button" onclick="window.location.href = 'DenyExchangeServlet?firstPostID=${o.secondPostID}&secondPostID=${o.firstPostID}'"
                                                        class="btn btn-outline-danger btn-sm">Deny Exchange</button>
                                                    </div>
                                                 </c:if>
                                        </a>
                                    </li>
                                </c:if> 
                                <c:if test="${o.notiType == 1}">
                                    <!-- thông báo đã đổi -->
                                    <c:if test="${o.seen == 0}">
                                        <li class="dropdown-item-noti not-seen"><a class="dropdown-item" href="#">
                                    </c:if>
                                    <c:if test="${o.seen == 1}">
                                        <li class="dropdown-item-noti"><a class="dropdown-item" href="#">
                                    </c:if>                            
                                    <div class="" onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'">
                                        <span class="normal"> You're agreed to exchange </span>
                                         <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.firstPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                        <span class="normal"> for </span>
                                        <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.secondPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                        <span class="normal"> with</span>
                                        <c:forEach items="${listUserAccount}" var="i">
                                                    <c:if test="${o.toUserID == i.userID}">
                                                        <span class="dropdown-item-noti-username">${i.userFullname}</span>
                                                    </c:if>
                                                </c:forEach>
                                        <span class="badge bg-primary">Agreed</span>
                                    </div>
                                    <div class="time-request">1 minutes ago</div>
                                </a>
                            </li>
                                </c:if>
                                <c:if test="${o.notiType == 3}">
                                     <c:if test="${o.seen == 0}">
                                        <li class="dropdown-item-noti not-seen"><a class="dropdown-item" href="#">
                                    </c:if>
                                    <c:if test="${o.seen == 1}">
                                        <li class="dropdown-item-noti"><a class="dropdown-item" href="#">
                                    </c:if>  
                                                 <!-- họ đồng ý bạn-->
                                    <div class="" onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'">
                                        <c:forEach items="${listUserAccount}" var="i">
                                                    <c:if test="${o.toUserID == i.userID}">
                                                        <span class="dropdown-item-noti-username">${i.userFullname}</span>
                                                    </c:if>
                                                </c:forEach>
                                        <span class="normal">agreed to exchange</span>
                                         <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.firstPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                        <span class="normal"> for </span>
                                        <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.secondPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                        <span class="normal"> with you.</span>
                                        <span class="badge bg-success">Agreed</span>
                                    </div>
                                    <div class="time-request">1 minutes ago</div>
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${o.notiType == 2}">                                        
                                    <!-- bạn từ chối -->
                                    <c:if test="${o.seen == 0}">
                                        <li class="dropdown-item-noti not-seen"><a class="dropdown-item" href="#">
                                    </c:if>
                                    <c:if test="${o.seen == 1}">
                                        <li class="dropdown-item-noti"><a class="dropdown-item" href="#">
                                    </c:if>
                                        <div class="" onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'">
                                            <span class="normal"> You refused to exchange </span>
                                                <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.secondPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                            <span class="normal"> for </span>
                                            <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.firstPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                          <span class="normal"> with</span>
                                        <c:forEach items="${listUserAccount}" var="i">
                                                    <c:if test="${o.toUserID == i.userID}">
                                                        <span class="dropdown-item-noti-username">${i.userFullname}</span>
                                                    </c:if>
                                                </c:forEach>
                                            <span class="badge bg-secondary">Refused</span>
                                            </div>
                                        <div class="time-request">1 minutes ago</div>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${o.notiType == 4}">
                                    <!-- họ từ chối bạn-->
                                    <c:if test="${o.seen == 0}">
                                        <li class="dropdown-item-noti not-seen"><a class="dropdown-item" href="#">
                                    </c:if>
                                    <c:if test="${o.seen == 1}">
                                        <li class="dropdown-item-noti"><a class="dropdown-item" href="#">
                                    </c:if>
                                        <div class="" onclick="window.location.href = 'UpdateSeenServlet?notiID=${o.notiID}'">
                                             <c:forEach items="${listUserAccount}" var="i">
                                                    <c:if test="${o.toUserID == i.userID}">
                                                        <span class="dropdown-item-noti-username">${i.userFullname}</span>
                                                    </c:if>
                                                </c:forEach>
                                            <span class="normal">refused to exchange</span>
                                            <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.firstPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                            <span class="normal"> for </span>
                                            <c:forEach items="${listPost}" var="i">
                                                    <c:if test="${o.secondPostID == i.postID}" >
                                                        <span class="dropdown-item-noti-product-title">${i.postTitle}</span>
                                                    </c:if>
                                                </c:forEach>
                                            <span class="normal"> with you.</span>
                                            <span class="badge bg-danger">Refused</span>
                                         </div>
                                        <div class="time-request">1 minutes ago</div>
                                        </a>
                                    </li>
                                </c:if> 
                            </c:forEach>   
                            <hr class="dropdown-divider">
                            </li>
                        </ul>
                    </li>
                    <!-- <li class="nav-item ">
                            <a class="nav-link px-0 py-0 ms-lg-3 me-lg-2 mt-lg-0 mb-lg-0 ms-0 mt-3 mb-2" href="#" > -->
                    <!-- image auto have object-fit : cover  -->
                    <!-- <img class="rounded-circle" width="40px" height="40px" alt="" src="resource/img/DE150066_LuongNguyenNhatQuang_2.jpg" alt="Nhat Quang">
                            </a>
                          </li> -->
                    <li class="nav-item dropdown">
                        <a class="nav-link px-0 py-0 ms-lg-3 me-lg-2 mt-lg-0 mb-lg-0 ms-0 mt-3 mb-2" href="#" id="navbarDropdown"
                           role="button">
                            <img class="rounded-circle" width="40px" height="40px" alt=""
                                 src="${currentAccount.userAvatarURL}" alt="${currentAccount.userUsername}">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end mt-2 username--overflow" aria-labelledby="navbarDropdown">
                            <div class="d-flex px-3 py-1 mb-2">
                                <img class="rounded-circle" width="48px" height="48px" alt=""
                                     src="${currentAccount.userAvatarURL}" alt="${currentAccount.userUsername}">
                                <div class=" ps-2">
                                    <div class="dropdown-username-text">${currentAccount.userFullname}</div>
                                    <div>
                                        <span style="color: #fdbc31;">
                                            <i class="fas fa-star fa-xs"></i>
                                        </span>
                                        <span style="color: #fdbc31;">
                                            <i class="fas fa-star fa-xs"></i>
                                        </span>
                                        <span style="color: #fdbc31;">
                                            <i class="fas fa-star fa-xs"></i>
                                        </span>
                                        <span style="color: #fdbc31;">
                                            <i class="fas fa-star fa-xs"></i>
                                        </span>
                                        <span style="color: #fdbc31;">
                                            <i class="fas fa-star fa-xs"></i>
                                        </span>
                                        <div class="dropdown-user-sub-text d-inline">
                                            <small>(433)</small>
                                        </div>
                                    </div>
                                    <div class="py-2 dropdown-user-sub-text">
                                        <!--<small class="d-block">(+84) 034 393 4215</small>-->
                                        <small>${currentAccount.userEmail}</small>
                                    </div>
                                </div>
                            </div>
                            <hr class="dropdown-divider" style="color: var(--text-sub-color) !important;">
                            <li class="dropdown-user-item">
                                <a class="dropdown-item " href="account">
                                    <span style="color: var(--text-sub-color);" class="dropdown-user-icon">
                                        <i class="fal fa-user"></i>
                                    </span>
                                    <span class="dropdown-user-text ">Personal Information</span>
                                </a>
                            </li>
                            <li class="dropdown-user-item">
                                <a class="dropdown-item" href="#">
                                    <span style="color: var(--text-sub-color);" class="dropdown-user-icon">
                                        <i class="fal fa-heart"></i>
                                    </span>
                                    <span class="dropdown-user-text">My Favorites</span>
                                </a>
                            </li>
                            <li class="dropdown-user-item">
                                <a class="dropdown-item" href="#">
                                    <span style="color: var(--text-sub-color);" class="dropdown-user-icon">
                                        <i class="fal fa-archive"></i>
                                    </span>
                                    <span class="dropdown-user-text">My Product</span>
                                </a>
                            </li>
                            <li class="dropdown-user-item">
                                <a class="dropdown-item " href="#">
                                    <span style="color: var(--text-sub-color);" class="dropdown-user-icon">
                                        <i class="fal fa-star"></i>
                                    </span>
                                    <span class="dropdown-user-text">My Reviews</span>
                                </a>
                            </li>
                            <div class="dropdown-divider w-75 ms-auto me-auto" style="color: var(--text-sub-color) !important;"></div>
                            <li class="dropdown-user-item">
                                <a class="dropdown-item" href="#">
                                    <span class="dropdown-user-text ms-0">Help</span>
                                </a>
                            </li>
                            <li class="dropdown-user-item">
                                <a class="dropdown-item" href="logout">
                                    <span class="dropdown-user-text ms-0">Sign out</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </c:if>
            <c:if test="${empty currentAccount}">
                <a class="nav-link" href="login">
                    <div class="header-text header-text--active">
                        <span style="color: var(--primary-color);" class="">
                            <i class="fas fa-sign-in"></i>
                        </span>
                        <span class="">Sign in</span>
                    </div>
                </a>             
            </c:if>

        </div>
    </div>
</nav>
