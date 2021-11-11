<%-- 
    Document   : userProfile
    Created on : Nov 11, 2021, 4:01:19 PM
    Author     : truon
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entity.UserAccount" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <jsp:include  page="/jsp/importer/base-css.jsp"></jsp:include>
            <!--<link rel="stylesheet" type="text/css" href="/DuniExchange/resource/css/bootstrapKhoi.css"/>-->
            <link rel="stylesheet" type="text/css" href="/DuniExchange/resource/css/styleKhoi.css"/>
            <link rel="stylesheet" type="text/css" href="/DuniExchange/resource/css/font-awesomeKhoi.min.css"/>


            <title>Profile</title>
        </head>
        <body class="innerPage" style>
        <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
            <div style="display: none;" class="bb-alent alent-success">
                <span>Hello world callback</span>
            </div>
            <!--Banner Start-->
            <div class="main_wrap">           
                <div class="container">
                    <div class="row">
                        <div class="profileWrap">
                            <div class="col-md-3 col-sm-3">
                                <div class="myItemLeft">
                                    <div class="myitemprofile">
                                        <div class="profile_left_img">
                                            <img class="profileImg" src="${requestScope.accountDetail.userAvatarURL}" style="width: 79px; height: 71px;" pagespeed_url_hash="1941820577" onload="pagespeed.CriticalImages.checkImageForCriticality(this);"/>
                                    </div>
                                    <div class="item_profile_name">
                                        <a style="curosr:pointer; color:#FFF;" href="/user/profile/13828">${requestScope.accountDetail.userUsername}</a>        
                                    </div>
                                </div>
                                <div class="profileCategory nav-stacked" data-spy="affix" data-offset-top="205">
                                    <ul id="yw0">

                                    </ul>    
                                </div>

                            </div>
                        </div>
                        <div class="col-md-9 col-sm-9" style="margin: 0 auto;">
                            <div class="myItemRight">
                                <div class="myItemRightHead">
                                    <h2>Profile</h2>
                                </div>
                                <div class="profileRight">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-5">
                                            <div>
                                                <img src="${requestScope.accountDetail.userAvatarURL}" style="width: 80%;" pagespeed_url_hash="1941820577" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-7">
                                            <div class="profileDetail">
                                                <div class="row">
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                            Username    
                                                        </div>                                        
                                                        <div class="profile_head_detail">
                                                            ${requestScope.accountDetail.userUsername}                            
                                                        </div>
                                                    </div>
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                        </div>
                                                    </div>
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                            Email                                    
                                                        </div>
                                                        <div class="profile_head_detail">
                                                            ${requestScope.accountDetail.userEmail}                                    
                                                        </div>
                                                    </div>
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                            Fullname                                    
                                                        </div>
                                                        <div class="profile_head_detail">
                                                            ${requestScope.accountDetail.userFullname}                                   
                                                        </div>
                                                    </div>
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                            Create date                                   
                                                        </div>
                                                        <div class="profile_head_detail">
                                                            ${requestScope.accountDetail.userCreateDate}                                    
                                                        </div>
                                                    </div>
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                            Rating                                    
                                                        </div>
                                                        <div class="profile_head_detail">
                                                            ${requestScope.accountDetail.userRating}                                    
                                                        </div>
                                                    </div>
                                                    <div class="profile_list">
                                                        <div class="profile_head">
                                                            Role                                    
                                                        </div>
                                                        <div class="profile_head_detail">
                                                            <c:if test="${requestScope.accountDetail.isAdmin == true}">
                                                                Admin
                                                            </c:if>     
                                                            <c:if test="${requestScope.accountDetail.isAdmin == false}">
                                                                User
                                                            </c:if>  
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix" ></div>
                                        <div class="row">
                                            <div class="col-sm-12" >
                                                <div class="createButtonWrap" style="text-align: center;">
                                                    <a class="btn btn-green" href="DisplayHomeServlet">Back home</a>                        
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12" style="padding-bottom: 20px;">

                        </div>
                    </div>   
                </div>    
            </div><!-- page -->
            <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>
            <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    </body>
</html>
