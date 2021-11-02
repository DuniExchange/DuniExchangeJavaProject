<%-- 
    Document   : detailProduct
    Created on : Oct 15, 2021, 1:40:28 PM
    Author     : acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="background: white">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--  base css importing-->
        <jsp:include  page="/jsp/importer/base-css.jsp"></jsp:include>
            <!-- home css -->
            <link rel="stylesheet" href="/DuniExchange/resource/css/home.css">
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="/DuniExchange/resource/css/bootstrap.min.css">
            <!-- Site CSS -->
            <link rel="stylesheet" href="/DuniExchange/resource/css/style.css">

            <link rel="stylesheet" href="/DuniExchange/resource/css/detail-page/detail-page.css">
            <!-- tiny slider -->
            <link rel="stylesheet" href="/DuniExchange/node_modules/tiny-slider/dist/tiny-slider.css">
            <title>Product detail</title>
            <style>
                .value-img {
                    display: block;
                    text-align: center;
                }
                img {
                    max-width: 100%;
                }
                /* Grid Zoom*/
                .grid {
                    column-count: 4;
                    column-gap: 1rem;
                }

                .grid figure {
                    display: inline-block;
                    margin: 0 0 0 0;
                    width: 100%;
                }
                .grid img {
                    width: 100%;
                    height: auto;
                }
            </style>
        </head>

        <body style="margin-left: 30px; margin-right: 30px">
            <!-- header import -->
        <jsp:include page="/jsp/importer/header.jsp"></jsp:include>



            <!-- End All Title Box -->
            <div class="product-detail-box-main" style="background: white">
                <!--padding: 70px 0px;-->

                <div class="containerVerTrang" style="background: white">
                    <div class="row">
                        <div class="col-xl-5 col-lg-5 col-md-6">
                            <!--<div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">-->
                            <div class="rt-container">
                                <div class="col-rt-12">
                                    <h4 style="margin-bottom:20px;"> Image of product</h4>
                                    <div class="grid">
                                    <c:forEach items="${lstImg}" var="lp">
                                        <figure>
                                            <img src="${lp.postImageURL}">
                                        </figure> 
                                    </c:forEach>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 col-md-6">
                        <div class="single-product-details">
                            <h1 class="title-all mb-2 text-uppercase "><strong>${pDt.postTitle}</strong></h1>
                            <h3>Category: </h3>        
                            <c:forEach items="${lstCate}" var="lc">
                                <a href="DisplayAllProductByCategory?caid=${lc.categoryID}"> &nbsp;${lc.categoryName} &nbsp;</a>
                            </c:forEach><br><br/>
                            <br><br/>
                            <p class="pt-1">${pDt.postDescription}</p><br>



                            <div class="table-responsive">
                                <table class="table table-sm table-borderless mb-0">

                                </table>
                            </div>
                            <hr>
                            <table class="information-of-seller table table-sm table-borderless mb-0">
                                <tbody>
                                    <tr>
                                        <th class="pl-0 w-25" scope="row" style="padding-top: 20px;">Author:</th>
                                        <td style="padding: 1.25rem 0.25rem;"> <img src="${pDt.userImage}" width="45px" class="rounded-circle">
                                            <a href="#">${pDt.userFullname}</a><br>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="date-of-sell">
                                <div class="containerVerTrang mb-2">
                                    <div class="row" style="flex-wrap: nowrap">
                                        <p class="pl-0 w-25">Post date: </p>
                                        <p>${pDt.postDate}</p>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary btn-md mr-1 mb-2">Exchange now</button>
                            <button type="button" class="btn btn-light btn-md mr-1 mb-2"><i
                                    class="fas fa-heart pr-2"></i>Like</button>
                        </div>
                    </div>
                    <div>
                        <form class="newsletter-box" action="PostComment" method="POST">
                            <div class="form-group">
                                <textarea class="p" style="width: 100%; background-color: #eee; border: none; border-radius: 2px" 
                                          name="Comment" placeholder="Write your comment here, you must login to post" required></textarea>
                                <input name="postID" class="form-control"  type="text" style="display: none" value="${pid}">
                            </div>

                            <c:if test="${sessionScope.currentAccount != null}"> 
                                <div class="form-group">
                                    <input name="userID" style="display: none" class="form-control"  type="text" value="${sessionScope.currentAccount.userID}">
                                </div>
                                <button type="submit" class="btn btn-primary btn-md mr-1 mb-2">Post</button>
                                </a>
                            </c:if>
                        </form>
                    </div>
                    <div class="container">
                        <div id="reviews" class="review-section">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h4 class="m-0" style="margin-right: 60px!important;margin-top: -73px;display: block;">${numComment} Reviews</h4>
                            </div>
                        </div>
                        <div class="d-flex1">
                            <c:forEach items="${listComment}" var="lcmt">
                                <div class="left">
                                    <span>
                                        <img src="${lcmt.userAvatarURLcmt}"
                                             class="rounded-circle" width="45px" alt="" />
                                    </span>
                                </div>
                                <div class="right">
                                    <h4>
                                        ${lcmt.userFullnamecmt}
                                        <span class="gig-rating text-body-2" style="color: rgb(235, 190, 67)">
                                            ${lcmt.userRatingcmt} <i class="fas fa-star"></i>
                                        </span>
                                    </h4>
                                    <div class="review-description">
                                        <p>
                                            ${lcmt.cmt}<br>
                                        </p>
                                    </div>
                                    <span class="publish py-3 d-inline-block w-100">Published: ${lcmt.tcmt}</span>
                                </div> 
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row my-5">
                    <div class="col-lg-12  my-3">
                        <div class="title-all text-center">
                            <h1>Other products</h1>
                            <p></p>
                        </div>
                        <div class="featured-products-box owl-carousel owl-theme">
                            <div class="item" style=" width: 400; height: 400">
                                <c:forEach items="${catePost}" var="ct">
                                    <div class="products-single fix " > 
                                        <div class="box-img-hover">
                                            <img src="${ct.postThumbnailURL}" class="img-fluid" alt="Image">

                                        </div>
                                        <div class="why-text">
                                            <a href="ProductDetail?postid=${ct.postID}">
                                                <h4>${ct.postTitle}</h4>
                                            </a>
                                            <h5>${ct.postDate}</h5>
                                            <h3 style="float: right">Liked: ${ct.postLike}</h3>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- JS -->
        <!--<script src="/DuniExchange/vendor/jquery/jquery.min.js"></script>-->
        <!--<script src="/DuniExchange/js/main.js"></script>-->
        <script src="/DuniExchange/resource/css/js/detailPage.js"></script>
        <!-- footer import -->
        <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>
            <!-- footer import -->

            <!-- <section style="height: 500px;"></section> -->
        <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
        <!-- scroll reveal -->
        <script src="/DuniExchange/node_modules/scrollreveal/dist/scrollreveal.js"></script>
        <!-- home page js -->
        <script src="/DuniExchange/resource/js/home.js"></script>

        <script src="/DuniExchange/resource/js/detail-page/zooming.min.js"></script>
        <script>
            new Zooming().listen('.grid img')
        </script>
        <script>
            const defaultZooming = new Zooming()
            const customZooming = new Zooming()
            const config = customZooming.config()
            const TRANSITION_DURATION_DEFAULT = config.transitionDuration
            const BG_COLOR_DEFAULT = config.bgColor
            const SCALE_BASE_DEFAULT = config.scaleBase
            const ACTIVE_CLASS = 'button-primary'

            const btnFast = document.getElementById('btn-fast')
            const btnDark = document.getElementById('btn-dark')
            const btnScaleSmall = document.getElementById('btn-scale-small')

            document.addEventListener('DOMContentLoaded', function () {
                defaultZooming.listen('#img-default')
                customZooming.listen('#img-custom')
            })

            btnFast.addEventListener('click', function (event) {
                const transitionDuration = toggleActive(btnFast)
                        ? 0.2
                        : TRANSITION_DURATION_DEFAULT

                customZooming.config({transitionDuration})
            })

            btnDark.addEventListener('click', function (event) {
                const bgColor = toggleActive(btnDark)
                        ? 'black'
                        : BG_COLOR_DEFAULT

                customZooming.config({bgColor})
            })

            btnScaleSmall.addEventListener('click', function (event) {
                const scaleBase = toggleActive(btnScaleSmall)
                        ? 0.7
                        : SCALE_BASE_DEFAULT

                customZooming.config({scaleBase})
            })

            function isActive(el) {
                return el.classList.contains(ACTIVE_CLASS)
            }

            function activate(el) {
                el.classList.add(ACTIVE_CLASS)
            }

            function deactivate(el) {
                el.classList.remove(ACTIVE_CLASS)
            }

            function toggleActive(el) {
                if (isActive(el)) {
                    deactivate(el)
                    return false
                } else {
                    activate(el)
                    return true
                }
            }

            if (document.getElementById("Comment").value == '')
            {
                alert("Please enter comment");
                document.getElementById("Comment").style.display = "none";
            }
        </script>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
