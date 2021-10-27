<%-- 
    Document   : detailProduct
    Created on : Oct 15, 2021, 1:40:28 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!--  base css importing-->
  <jsp:include  page="/jsp/importer/base-css.jsp"></jsp:include>
  <!-- home css -->
  <link rel="stylesheet" href="/DuniExchange/resource/css/home.css">

  <link rel="stylesheet" href="/DuniExchange/resource/css/detailPage/detailPage.css">
  <!-- tiny slider -->
  <link rel="stylesheet" href="/DuniExchange/node_modules/tiny-slider/dist/tiny-slider.css">
  <title>Product detail</title>
</head>

<body style="margin-left: 30px; margin-right: 30px">
    <!-- header import -->
    <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
    <!-- header import -->
    
  <!-- section landing image -->
  <!-- Start All Title Box -->
  <div class="all-title-box" style="padding-top: 15px">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Chi tiết sản phẩm</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Product</a></li>
                        <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <div class="product-detail-box-main">
        <!--padding: 70px 0px;-->

        <div class="containerVerTrang">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" style="width: fit-content" role="listbox" >
                            <div class="carousel-item active" style="float: none; height: -webkit-fill-available; "> <img class="d-block w-100" 
                                    src="https://www.englishclub.com/images/vocabulary/food/vegetables/vegetables.jpg" alt="First slide"> </div>
                            <div class="carousel-item" style="float: none;height: -webkit-fill-available; "> <img class="d-block w-100"
                                    src="https://freehost.page/wp-content/uploads/2021/02/xuc-xac.jpg" alt="Second slide"> </div>
                            <div class="carousel-item" style="float: none;height: -webkit-fill-available; "> <img class="d-block w-100"
                                    src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png" alt="Third slide"> </div>
<!--                            <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev">
                                <i class="fa fa-angle-left" aria-hidden="true"></i>
                                <span class="sr-only">Previous</span>
                            </a>-->
<!--                            <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next">
                                <i class="fa fa-angle-right" aria-hidden="true"></i>
                                <span class="sr-only">Next</span>
                            </a>-->
                            <ol class="carousel-indicators" style="justify-content: space-around">
                                <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                    <img class="d-block w-100 img-fluid" src="https://www.englishclub.com/images/vocabulary/food/vegetables/vegetables.jpg"
                                        alt="" />
                                </li>
                                <li data-target="#carousel-example-1" data-slide-to="1">
                                    <img class="d-block w-100 img-fluid" src="https://freehost.page/wp-content/uploads/2021/02/xuc-xac.jpg"
                                        alt="" />
                                </li>
                                <li data-target="#carousel-example-1" data-slide-to="2">
                                    <img class="d-block w-100 img-fluid" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"
                                        alt="" />
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <h1 class="title-all mb-2 text-uppercase "><strong>Chiếc áo phông sặc sỡ, suýt nữa thành đồ gia
                                truyền nhưng nay được đem ra đổi</strong></h1>
                        <h3>Phân loại: </h3>        
                            <c:forEach items="${listcate}" var="lc">
                                <a href="categoryServlet?caid=${lc.cid}"> &nbsp;${lc.cname} &nbsp;</a>
                            </c:forEach><br><br/>
                        <p class="pt-1">Đây là chiếc áo có màu sắc sặc sỡ, bla bla (giới thiệu sản phẩm)Đây là chiếc áo
                            có màu sắc sặc sỡ, bla bla (giới thiệu sản phẩm)Đây là chiếc áo có màu sắc sặc sỡ, bla bla
                            (giới thiệu sản phẩm)Đây là chiếc áo có màu sắc sặc sỡ, bla bla (giới thiệu sản phẩm)Đây là
                            chiếc áo có màu sắc sặc sỡ, bla bla (giới thiệu sản phẩm)Đây là chiếc áo có màu sắc sặc sỡ,
                            bla bla (giới thiệu sản phẩm)Đây là chiếc áo có màu sắc sặc sỡ, bla bla (giới thiệu sản
                            phẩm)</p>

                        <div class="table-responsive">
                            <table class="table table-sm table-borderless mb-0">
                                
                            </table>
                        </div>
                        <hr>
                        <table class="information-of-seller table table-sm table-borderless mb-0">
                            <tbody>
                                <tr>
                                    <th class="pl-0 w-25" scope="row" style="padding-top: 20px;">Được đăng bởi</th>
                                    <td> <img src="images\img-2.jpg" width="45px" class="rounded-circle">
                                        <a href="#">Uyên Trang</a><br>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="date-of-sell">
                            <div class="containerVerTrang mb-2">
                                <div class="row">
                                    <p class="pl-0 w-25">Ngày đăng</p>
                                    <p>30/95/2001</p>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary btn-md mr-1 mb-2">Trao đổi ngay</button>
                        <button type="button" class="btn btn-light btn-md mr-1 mb-2"><i
                                class="fas fa-heart pr-2"></i>Like</button>
                    </div>
                </div>
                <div>
                    <form class="newsletter-box">
                        <div class="form-group">
                            <textarea class="p" style="width: 100%; background-color: #eee; border: none; border-radius: 2px" 
                                   name="Comment" placeholder="Write your comment here" ></textarea>
                        </div>
                        <button type="button" class="btn btn-primary btn-md mr-1 mb-2">Post</button>
                    </form>
                </div>
                <div class="container">
                    <div id="reviews" class="review-section">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h4 class="m-0">37 Reviews</h4>
                            
                        </div>
                       
                    </div>

                    <div class="review-list">
                        <ul>
                            <li>
                                <div class="d-flex">
                                    <div class="left">
                                        <span>
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                                class="profile-pict-img img-fluid" alt="" />
                                        </span>
                                    </div>
                                    <div class="right">
                                        <h4>
                                            Askbootstrap
                                            <span class="gig-rating text-body-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792"
                                                    width="15" height="15">
                                                    <path fill="currentColor"
                                                        d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z">
                                                    </path>
                                                </svg>
                                                5.0
                                            </span>
                                        </h4>
                                        <div class="country d-flex align-items-center">
                                            <span>
                                                <img class="country-flag img-fluid"
                                                    src="https://bootdey.com/img/Content/avatar/avatar6.png" />
                                            </span>
                                            <div class="country-name font-accent">India</div>
                                        </div>
                                        <div class="review-description">
                                            <p>
                                                The process was smooth, after providing the required info, Pragyesh sent
                                                me an outstanding packet of wireframes. Thank you a lot!
                                            </p>
                                        </div>
                                        <span class="publish py-3 d-inline-block w-100">Published 4 weeks ago</span>
                                        <div class="helpful-thumbs">
                                            <div class="helpful-thumb text-body-2">
                                                <span class="fit-icon thumbs-icon">
                                                    <svg width="14" height="14" viewBox="0 0 14 14"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M13.5804 7.81165C13.8519 7.45962 14 7 14 6.43858C14 5.40843 13.123 4.45422 12.0114 4.45422H10.0932C10.3316 3.97931 10.6591 3.39024 10.6591 2.54516C10.6591 0.948063 10.022 0 8.39207 0C7.57189 0 7.26753 1.03682 7.11159 1.83827C7.01843 2.31708 6.93041 2.76938 6.65973 3.04005C6.01524 3.68457 5.03125 5.25 4.44013 5.56787C4.38028 5.59308 4.3038 5.61293 4.22051 5.62866C4.06265 5.39995 3.79889 5.25 3.5 5.25H0.875C0.391754 5.25 0 5.64175 0 6.125V13.125C0 13.6082 0.391754 14 0.875 14H3.5C3.98325 14 4.375 13.6082 4.375 13.125V12.886C5.26354 12.886 7.12816 14.0002 9.22728 13.9996C9.37781 13.9997 10.2568 14.0004 10.3487 13.9996C11.9697 14 12.8713 13.0183 12.8188 11.5443C13.2325 11.0596 13.4351 10.3593 13.3172 9.70944C13.6578 9.17552 13.7308 8.42237 13.5804 7.81165ZM0.875 13.125V6.125H3.5V13.125H0.875ZM12.4692 7.5565C12.9062 7.875 12.9062 9.1875 12.3159 9.48875C12.6856 10.1111 12.3529 10.9439 11.9053 11.1839C12.1321 12.6206 11.3869 13.1146 10.3409 13.1246C10.2504 13.1255 9.32247 13.1246 9.22731 13.1246C7.23316 13.1246 5.54296 12.011 4.37503 12.011V6.44287C5.40611 6.44287 6.35212 4.58516 7.27847 3.65879C8.11368 2.82357 7.83527 1.43153 8.3921 0.874727C9.78414 0.874727 9.78414 1.84589 9.78414 2.54518C9.78414 3.69879 8.94893 4.21561 8.94893 5.32924H12.0114C12.6329 5.32924 13.1223 5.88607 13.125 6.44287C13.1277 6.99967 12.9062 7.4375 12.4692 7.5565ZM2.84375 11.8125C2.84375 12.1749 2.54994 12.4688 2.1875 12.4688C1.82506 12.4688 1.53125 12.1749 1.53125 11.8125C1.53125 11.4501 1.82506 11.1562 2.1875 11.1562C2.54994 11.1562 2.84375 11.4501 2.84375 11.8125Z">
                                                        </path>
                                                    </svg>
                                                </span>
                                                <span class="thumb-title">Helpful           </span>
                                            </div>
                                            <div class="helpful-thumb text-body-2 ml-3">
                                                <span class="fit-icon thumbs-icon">
                                                    <svg width="14" height="14" viewBox="0 0 14 14"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M0.419563 6.18835C0.148122 6.54038 6.11959e-07 7 5.62878e-07 7.56142C2.81294e-05 8.59157 0.876996 9.54578 1.98863 9.54578L3.90679 9.54578C3.66836 10.0207 3.34091 10.6098 3.34091 11.4548C3.34089 13.0519 3.97802 14 5.60793 14C6.42811 14 6.73247 12.9632 6.88841 12.1617C6.98157 11.6829 7.06959 11.2306 7.34027 10.9599C7.98476 10.3154 8.96875 8.75 9.55987 8.43213C9.61972 8.40692 9.6962 8.38707 9.77949 8.37134C9.93735 8.60005 10.2011 8.75 10.5 8.75L13.125 8.75C13.6082 8.75 14 8.35825 14 7.875L14 0.875C14 0.391754 13.6082 -3.42482e-08 13.125 -7.64949e-08L10.5 -3.0598e-07C10.0168 -3.48226e-07 9.625 0.391754 9.625 0.875L9.625 1.11398C8.73647 1.11398 6.87184 -0.000191358 4.77272 0.00038257C4.62219 0.000300541 3.74322 -0.000438633 3.65127 0.000382472C2.03027 -1.04643e-06 1.12867 0.981667 1.18117 2.45566C0.76754 2.94038 0.564868 3.64065 0.682829 4.29056C0.342234 4.82448 0.269227 5.57763 0.419563 6.18835ZM13.125 0.875L13.125 7.875L10.5 7.875L10.5 0.875L13.125 0.875ZM1.53079 6.4435C1.09375 6.125 1.09375 4.8125 1.6841 4.51125C1.31436 3.88891 1.64713 3.05613 2.09467 2.81605C1.86791 1.37941 2.61313 0.885417 3.65906 0.875355C3.74962 0.874535 4.67753 0.875355 4.77269 0.875355C6.76684 0.875355 8.45704 1.98898 9.62497 1.98898L9.62497 7.55713C8.5939 7.55713 7.64788 9.41484 6.72153 10.3412C5.88632 11.1764 6.16473 12.5685 5.6079 13.1253C4.21586 13.1253 4.21586 12.1541 4.21586 11.4548C4.21586 10.3012 5.05107 9.78439 5.05107 8.67076L1.9886 8.67076C1.36708 8.67076 0.877707 8.11393 0.874973 7.55713C0.872266 7.00033 1.09375 6.5625 1.53079 6.4435ZM11.1563 2.1875C11.1563 1.82506 11.4501 1.53125 11.8125 1.53125C12.1749 1.53125 12.4688 1.82506 12.4688 2.1875C12.4688 2.54994 12.1749 2.84375 11.8125 2.84375C11.4501 2.84375 11.1563 2.54994 11.1563 2.1875Z">
                                                        </path>
                                                    </svg>
                                                </span>
                                                <span class="thumb-title">Not Helpful</span>
                                            </div>
                                        </div>
                                        <div class="response-item mt-4 d-flex">
                                            <div class="left">
                                                <span>
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png"
                                                        class="profile-pict-img img-fluid" alt="" />
                                                </span>
                                            </div>
                                            <div class="right">
                                                <h4>
                                                    Gurdeep Osahan
                                                    <span class="gig-rating text-body-2">
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792"
                                                            width="15" height="15">
                                                            <path fill="currentColor"
                                                                d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z">
                                                            </path>
                                                        </svg>
                                                        5.0
                                                    </span>
                                                </h4>
                                                <div class="country d-flex align-items-center">
                                                    <span>
                                                        <img class="country-flag img-fluid"
                                                            src="https://bootdey.com/img/Content/avatar/avatar3.png" />
                                                    </span>
                                                    <div class="country-name font-accent">India</div>
                                                </div>
                                                <div class="review-description">
                                                    <p>
                                                        The process was smooth, after providing the required info,
                                                        Pragyesh sent me an outstanding packet of wireframes. Thank you
                                                        a lot!
                                                    </p>
                                                </div>
                                                <span class="publish py-3 d-inline-block w-100">Published 4 weeks
                                                    ago</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <hr>
            <div class="row my-5">
                <div class="col-lg-12  my-3">
                    <div class="title-all text-center">
                        <h1>Vật phẩm khác</h1>
                        <p></p>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <div class="item">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <img src="https://www.englishclub.com/images/vocabulary/food/vegetables/vegetables.jpg" class="img-fluid" alt="Image">
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                        class="fas fa-eye"></i></a></li>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                    title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                        </ul>
                                        <a class="cart" href="#">Đưa vào giỏ hàng</a>
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4>Cà rốt nhà trồng, bao nhà trồng</h4>
                                    <h5>31/05/2021</h5>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <img src="https://www.englishclub.com/images/vocabulary/food/vegetables/vegetables.jpg" class="img-fluid" alt="Image">
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                        class="fas fa-eye"></i></a></li>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                    title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                        </ul>
                                        <a class="cart" href="#">Đưa vào giỏ hàng</a>
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4>Cà chua bao chua</h4>
                                    <h5>31/05/2021</h5>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <img src="https://www.englishclub.com/images/vocabulary/food/vegetables/vegetables.jpg" class="img-fluid" alt="Image">
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Xem"><i
                                                        class="fas fa-eye"></i></a></li>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right"
                                                    title="Thêm vào danh sách ước"><i class="far fa-heart"></i></a></li>
                                        </ul>
                                        <a class="cart" href="#">Đưa vào giỏ hàng</a>
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4>Nho còn tại giàn</h4>
                                    <h5>31/05/2021</h5>
                                </div>
                            </div>
                        </div>


                    </div>
                    <button class="btn hvr-hover" style="float: right; color: white;">Xem thêm</button>
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
  
   <script type="module">
    import { tns } from '/DuniExchange/node_modules/tiny-slider/src/tiny-slider.js';
    var slider = tns({
      container: '.my-slider',
      items: 2,
      // slideBy: 'page',
      autoplay: true,
      center: true,
      loop: true,
      swipeAngle: false,
      speed: 400,
      gutter: 30,
      edgePadding: -70,
      controlsPosition: "bottom",
      mouseDrag: true,
      responsive: {
        "300": {
          "items": 1,
          edgePadding: 0
        },
        "700": {
          "items": 2,
          edgePadding: -90
        }
      }
    });
    var sliders = tns({
      container: '.my-slider-2',
      items: 2,
      // slideBy: 'page',
      autoplay: true,
      center: true,
      loop: true,
      swipeAngle: false,
      speed: 400,
      gutter: 30,
      edgePadding: -70,
      controlsPosition: "bottom",
      responsive: {
        "300": {
          "items": 1,
          edgePadding: 0
        },
        "950": {
          "items": 2,
          edgePadding: -90
        }
      }
    });
  </script>
  <!-- <section style="height: 500px;"></section> -->
  <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
  <!-- scroll reveal -->
  <script src="/DuniExchange/node_modules/scrollreveal/dist/scrollreveal.js"></script>
  <!-- home page js -->
  <script src="/DuniExchange/resource/js/home.js"></script>
  
  <script src="/DuniExchange/resource/js/detailPage/jquery-3.2.1.min.js"></script>
  <script src="/DuniExchange/resource/js/detailPage/popper.min.js"></script>
  <script src="/DuniExchange/resource/js/detailPage/bootstrap.min.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
