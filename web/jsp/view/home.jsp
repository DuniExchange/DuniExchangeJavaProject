<%-- 
    Document   : home
    Created on : Oct 8, 2021, 6:10:39 PM
    Author     : Minky
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

  <!-- tiny slider -->
  <link rel="stylesheet" href="/DuniExchange/node_modules/tiny-slider/dist/tiny-slider.css">
  <title>Document</title>
</head>

<body>
    <!-- header import -->
    <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
    <!-- header import -->
    
  <!-- section landing image -->
  <section class="landing container py-5 mt-5" style="background-color: #fff;">
    <div class="row align-items-center mt-md-2 d-flex">
      <div class="reveal-right-landing col-lg-7 order-lg-2 mb-lg-0 mb-4 pb-2 pb-lg-0">
        <img src="/DuniExchange/resource/img/landingimg-4.png" alt="" class="d-block mx-auto img-fluid" width="80%">
        <!-- <img src="resource/img/3075752.jpg" alt="" class="d-block mx-auto img-fluid" width="80%"> -->

      </div>
      <div class="col-lg-5 order-lg-1 pe-lg-0">
        <h1 class="reveal-left-landing text-center text-lg-start mb-4 landing-title">Start <span
            class="landing-title--active"
            onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">Exchange</span>
          <br class="d-lg-block d-none">around the World
        </h1>
        <p class="reveal-left-landing-text text-lg-start text-center mb-4 mb-lg-8 fs-lg landing-title-sub-text">Connect
          friends from all over the
          world, exchange your favorite items with just a few simple steps.</p>
        <div class="text-lg-start text-center reveal-up-landing-button">
          <button class="btn btn-primary btn-lg d-lg-block d-none ">Start exploring now!</button>
          <button class="btn btn-primary d-lg-none">Start exploring now!</button>
        </div>
      </div>
    </div>
  </section>
  <!-- end section landing image -->
  <!-- start a category -->
  <section class="container pb-5 mt-5 mb-lg-3 d-flex reveal-up-landing-button" style="flex-wrap: wrap">
    <a class=" category-bg-blue d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-yellow d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-primary d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
    0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman</h3>
    </a>
    <a class=" category-bg-green d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-yellow d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-blue d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
    0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-ellipsis-h"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">More</h3>
    </a>
  </section>
  <!-- start how it work -->
  <section class="how-it-work container pb-5 mt-5 mb-lg-3">
    <div class="row text-center mb-5 pb-lg-3">
      <small class="reveal-section-sub-title text-sub-title-section mb-2">Exchange now!</small>
      <h2 class="reveal-section-title text-title-section">How we works</h2>
    </div>
    <div class="how-it-work-all-item">
      <div style="width: 190px;" class="reveal-hiw-1 d-inline-block how-it-work-img">
        <img src="/DuniExchange/resource/img/post your product.png" alt="" width="190" class=" mb-4">
        <div class="how-it-work-step text-center my-auto mx-auto"> <span>01<br>STEP</span></div>
        <div class="text-center how-it-work-guideline">Post Your Items</div>
      </div>
      <span class="reveal-hiw-1 how-it-work-arrow d-none d-md-flex"><img src="/DuniExchange/resource/img/arrow-up-2.png" alt=""
          width="85"></span>
      <div style="width: 190px;" class="reveal-hiw-2 d-inline-block how-it-work-img">
        <img src="/DuniExchange/resource/img/requestanexchange.png" alt="" width="190" class=" mb-4">
        <div class="how-it-work-step text-center my-auto mx-auto"> <span>02<br>STEP</span></div>
        <div class="text-center how-it-work-guideline">Request an Exchange</div>
      </div>
      <div class="reveal-hiw-2 how-it-work-arrow d-none d-xl-flex"><img src="/DuniExchange/resource/img/arrow-down.png" alt=""
          width="85"></div>
      <div class="break"></div>
      <div style="width: 190px;" class="reveal-hiw-3 d-inline-block how-it-work-img">
        <img src="/DuniExchange/resource/img/waitforaceeptance.png" alt="" width="190" class=" mb-4">
        <div class="how-it-work-step text-center my-auto mx-auto"> <span>03<br>STEP</span></div>
        <div class="text-center how-it-work-guideline">Wait for Acceptance</div>
      </div>
      <div class="reveal-hiw-3 how-it-work-arrow d-none d-lg-flex"><img src="/DuniExchange/resource/img/arrow-up-2.png" alt=""
          width="85"></div>
      <div class="reveal-hiw-3 how-it-work-arrow d-none d-md-flex d-lg-none"><img src="/DuniExchange/resource/img/arrow-down.png"
          alt="" width="85"></div>
      <div style="width: 190px;" class="reveal-hiw-4 d-inline-block how-it-work-img">
        <img src="/DuniExchange/resource/img/exchangeandenjoy-2.png" style="-webkit-transform: scaleX(-1);transform: scaleX(-1);"
          alt="" width="190" class=" mb-4">
        <div class="how-it-work-step text-center my-auto mx-auto"> <span>04<br>STEP</span></div>
        <div class="text-center how-it-work-guideline">Exchange and Enjoy</div>
      </div>
  </section>
  <!-- star latest post -->
  <section class="container ">
    <div class="row text-center mb-2 pb-lg-3 align-items-center justify-content-between">
      <h2 class="text-title text-start d-inline mb-0" style="width: auto">The Latest Post</h2>
      <div class="view-all">
        <a href="#">View all
          <span>
            <i class="far fa-long-arrow-right"></i>
          </span>
        </a>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-12 latest-post-product mb-md-4"
        onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">
        <div class="latest-post-img-cover">
          <img src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt="" class="img-fluid">
          <a href="#"><button class="like-button btn">
              <span style="margin-top: 2px;">
                <i class="far fa-heart"></i>
              </span>
            </button></a>
        </div>
        <div class="latest-product-content">
          <h3 class="latest-post-title mt-2 mb-0"><span class="latest-post-username">Uyên Trang</span> muốn đổi <span
              class="latest-post-product-name"></span> Váy ngủ trẻ em xinh xắn </h3>
          <p class="latest-post-description">Chiếc váy trẻ em còn rất mới, phù hợp với mọi lứa tuổi, nay tôi muốn đổi
          </p>
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
              <span><i class="far fa-tshirt"></i></span>
              <span>Women's fashion</span>
            </li>
          </ul>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 col-sm-12 latest-post-product mb-md-4"
        onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">
        <div class="latest-post-img-cover">
          <img src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt="" class="img-fluid">
          <a href="https://www.facebook.com/"><button class="like-button btn">
              <span style="margin-top: 2px;">
                <i class="far fa-heart"></i>
              </span>
            </button></a>
        </div>
        <div class="latest-product-content">
          <h3 class="latest-post-title mt-2 mb-0"><span class="latest-post-username">Uyên Trang</span> muốn đổi <span
              class="latest-post-product-name"></span> Váy ngủ trẻ em xinh xắn </h3>
          <p class="latest-post-description">Chiếc váy trẻ em còn rất mới, phù hợp với mọi lứa tuổi, nay tôi muốn đổi
          </p>
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
              <span><i class="far fa-tshirt"></i></span>
              <span>Women's fashion</span>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 latest-post-product mb-md-4"
        onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">
        <div class="latest-post-img-cover">
          <img src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt="" class="img-fluid">
          <a href="https://www.facebook.com/"><button class="like-button btn">
              <span style="margin-top: 2px;">
                <i class="far fa-heart"></i>
              </span>
            </button></a>
        </div>
        <div class="latest-product-content">
          <h3 class="latest-post-title mt-2 mb-0"><span class="latest-post-username">Uyên Trang</span> muốn đổi <span
              class="latest-post-product-name"></span> Váy ngủ trẻ em xinh xắn </h3>
          <p class="latest-post-description">Chiếc váy trẻ em còn rất mới, phù hợp với mọi lứa tuổi, nay tôi muốn đổi
          </p>
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
              <span><i class="far fa-tshirt"></i></span>
              <span>Women's fashion</span>
            </li>
          </ul>
        </div>
      </div>

      <div class="col-lg-4 col-md-6 col-sm-12 latest-post-product mb-md-4 d-lg-none"
        onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">
        <div class="latest-post-img-cover">
          <img src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt="" class="img-fluid">
          <a href="https://www.facebook.com/"><button class="like-button btn">
              <span style="margin-top: 2px;">
                <i class="far fa-heart"></i>
              </span>
            </button></a>
        </div>
        <div class="latest-product-content">
          <h3 class="latest-post-title mt-2 mb-0"><span class="latest-post-username">Uyên Trang</span> muốn đổi <span
              class="latest-post-product-name"></span> Váy ngủ trẻ em xinh xắn </h3>
          <p class="latest-post-description">Chiếc váy trẻ em còn rất mới, phù hợp với mọi lứa tuổi, nay tôi muốn đổi
          </p>
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
              <span><i class="far fa-tshirt"></i></span>
              <span>Women's fashion</span>
            </li>
          </ul>
        </div>
      </div>

    </div>
  </section>
  <!-- những con số ấn tuọngq impressive-number-->
  <section class="impressive-number container pb-5 mt-5 mb-lg-3">
    <div class="row text-center mb-5 pb-lg-3">
      <small class="reveal-section-sub-title text-sub-title-section mb-2">Exchange now!</small>
      <h2 class="reveal-section-title text-title-section">Impressive numbers</h2>
    </div>

    <div>
      <ul class="d-flex justify-content-around text-center impressive-list" id="impressive-list"
        style="flex-wrap: wrap;">
        <li class="impressive-item">
          <div><i class="far fa-users"></i></div>
          <div class="impressive-item-number"><span class="impressive-item-number-count">1 200</span>+</div>
          <div class="impressive-item-description">Total Users</div>
        </li>
        <li class="impressive-item">
          <div><i class="far fa-barcode-read"></i></div>
          <div class="impressive-item-number"><span class="impressive-item-number-count">16 500</span>+</div>
          <div class="impressive-item-description">Total Items</div>
        </li>
        <li class="impressive-item">
          <div><i class="far fa-handshake"></i></div>
          <div class="impressive-item-number"><span class="impressive-item-number-count">3 200</span>+</div>
          <div class="impressive-item-description">Total Exchange</div>
        </li>
        <li class="impressive-item">
          <div><i class="far fa-heart"></i></div>
          <div class="impressive-item-number"><span class="impressive-item-number-count">1 200 950</span>+</div>
          <div class="impressive-item-description">Total Likes</div>
        </li>
      </ul>
    </div>
  </section>


  <!-- top like post -->
  <section class="container top-like-post">
    <div class="row text-center mb-2 pb-lg-3 align-items-center justify-content-between">
      <h2 class="text-title text-start d-inline mb-0" style="width: auto">The Top Like Post</h2>
      <div class="view-all">
        <a href="#">View all
          <span>
            <i class="far fa-long-arrow-right"></i>
          </span>
        </a>
      </div>
    </div>
    <div class="my-slider">
      <div class="slide-cover">
        <div class="slide-cover-item">
          <!-- <div class="slide-cover-item-img" style="background-image: url('resource/img/product-img/xinhDep.jpeg');"></div> -->
          <div class="slide-cover-item-img"
            style="background:linear-gradient(to bottom, rgba(0,0,0,0) 25%, rgba(0,0,0,1)), url('/DuniExchange/resource/img/product-img/xinhDep.jpeg');">
          </div>
          <div class="top-like-item-like-cover">
            <div class="top-like-item-like"><i class="far fa-heart"></i>
              <div class="top-like-like-number">1680</div>
            </div>
          </div>
          <div class="row position-absolute w-100 top-like-item-content">
            <div class="col-4 pe-0">
              <div class="top-like-item-title"
                onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">Cô ny zui zẻ
                xinh xắn dễ thương dễ thương đem ra đổi</div>
            </div>
            <div class="col-6 d-flex" style="justify-content: center; align-items: center;">
              <div class="top-like-item-description">Cô người yêu zui zẻ xinh xắn dễ thương bla bla muốn đem ra đổi, ai
                lấy thì lấy ko lấy lo lấy đạp giờ Cô người yêu zui zẻ xinh xắn dễ Cô người yêu zui zẻ xinh xắnCô người
                yêu zui zẻ xinh xắn</div>
            </div>
            <div class="col-2 d-flex ps-0" style="justify-content: center; align-items: center;">
              <div class="top-like-item-user">
                <!-- <div> -->
                <div class="text-center"><img style="border-radius: 50%; object-fit: cover;"
                    src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg" alt="" width="40px" height="40px"></div>
                <div class="text-center">Nhat Quang</div>
                <!-- </div> -->

              </div>
            </div>
            <ul class="list-description">
              <li class="list-description-item">
                <span><i class="far fa-eye"></i></span>
                <span>348</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-clock"></i></span>
                <span>23-05-2001</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-comment-alt-dots"></i></span>
                <span>578</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-tshirt"></i></span>
                <span>Women's fashion</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-hand-sparkles"></i></span>
                <span>250 Request exchange</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-handshake"></i></span>
                <span>Item Exchanged</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="slide-cover">
        <div class="slide-cover-item">
          <!-- <div class="slide-cover-item-img" style="background-image: url('resource/img/product-img/xinhDep.jpeg');"></div> -->
          <div class="slide-cover-item-img"
            style="background:linear-gradient(to bottom, rgba(0,0,0,0) 25%, rgba(0,0,0,1)), url('/DuniExchange/resource/img/product-img/khoa-hoc.jpg'); background-size: cover;">
          </div>
          <div class="top-like-item-like-cover">
            <div class="top-like-item-like">
              <i class="far fa-heart"></i>
              <div class="top-like-like-number">1250</div>
            </div>
          </div>
          <div class="row position-absolute w-100 top-like-item-content">
            <div class="col-4">
              <div class="top-like-item-title pe-0"
                onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">Khóa học
                MAS291, học 1 lần lấy Cóc Vàng luôn
              </div>
            </div>
            <div class="col-6 d-flex" style="justify-content: center; align-items: center;">
              <div class="top-like-item-description">Mình có một khóa học của anh Nhật Quang LNN muốn đem ra đổi</div>
            </div>
            <div class="col-2 d-flex ps-0" style="justify-content: center; align-items: center;">
              <div class="top-like-item-user">
                <!-- <div> -->
                <div class="text-center"><img style="border-radius: 50%; object-fit: cover;"
                    src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg" alt="" width="40px" height="40px"></div>
                <div class="text-center">Nhat Quang</div>
                <!-- </div> -->

              </div>
            </div>
            <ul class="list-description">
              <li class="list-description-item">
                <span><i class="far fa-eye"></i></span>
                <span>348</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-clock"></i></span>
                <span>23-05-2001</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-comment-alt-dots"></i></span>
                <span>578</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-tshirt"></i></span>
                <span>Women's fashion</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-hand-sparkles"></i></span>
                <span>250 Request exchange</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-handshake"></i></span>
                <span>Item Exchanged</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="slide-cover">
        <div class="slide-cover-item">
          <!-- <div class="slide-cover-item-img" style="background-image: url('resource/img/product-img/xinhDep.jpeg');"></div> -->
          <div class="slide-cover-item-img"
            style="background:linear-gradient(to bottom, rgba(0,0,0,0) 25%, rgba(0,0,0,1)), url('/DuniExchange/resource/img/product-img/tui-deo-cheo-di-choi-03.jpg'); background-color: var(--primary-color);">
          </div>
          <div class="top-like-item-like-cover">
            <div class="top-like-item-like"><i class="far fa-heart"></i>
              <div class="top-like-like-number">1120</div>
            </div>
          </div>
          <div class="row position-absolute w-100 top-like-item-content">
            <div class="col-4">
              <div class="top-like-item-title pe-0"
                onclick="window.location.href = 'https://fontawesome.com/v5.15/icons/bell?style=duotone'">Túi đeo chéo
                đi chơi siêu cu te luôn nè</div>
            </div>
            <div class="col-6 d-flex" style="justify-content: center; align-items: center;">
              <div class="top-like-item-description">Mình có một chiếc túi muốn đổi, bạn gái nào chưa có chủ mình tặng
                người đổi luôn!!</div>
            </div>
            <div class="col-2 d-flex ps-0" style="justify-content: center; align-items: center;">
              <div class="top-like-item-user">
                <!-- <div> -->
                <div class="text-center"><img style="border-radius: 50%; object-fit: cover;"
                    src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg" alt="" width="40px" height="40px"></div>
                <div class="text-center">Nhat Quang</div>
                <!-- </div> -->

              </div>
            </div>
            <ul class="list-description">
              <li class="list-description-item">
                <span><i class="far fa-eye"></i></span>
                <span>348</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-clock"></i></span>
                <span>23-05-2001</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-comment-alt-dots"></i></span>
                <span>578</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-tshirt"></i></span>
                <span>Women's fashion</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-hand-sparkles"></i></span>
                <span>250 Request exchange</span>
              </li>
              <li class="list-description-item">
                <span><i class="far fa-handshake"></i></span>
                <span>Item Exchanged</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end top like post -->
  <!-- start a category -->
  <section class="container pb-5 mt-5 mb-lg-3 d-flex reveal-up-category"  style="flex-wrap: wrap">
    <a class="category-bg-blue d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-yellow d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-primary d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
    0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman</h3>
    </a>
    <a class=" category-bg-green d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-yellow d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
      0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-tshirt"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">Woman's fashion</h3>
    </a>
    <a class=" category-bg-blue d-inline-block flex-row align-items-center flex-shrink-0 border-0 rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4"
      href="#" style=" box-shadow: 0 0.125rem 0.125rem -0.125rem rgba(31, 27, 45, 0.08),
    0 0.25rem 0.75rem rgba(31, 27, 45, 0.08);">
      <div class="d-inline-block"><span class="category-icon"><i class="far fa-ellipsis-h"></i></span></div>
      <h3 class="category-name d-inline-block ps-1 pe-2 mb-0">More</h3>
    </a>
  </section>

  <!-- the latest Exchange post -->
  <section class="container the-latest-exchange-post">
    <div class="row text-center mb-2 pb-lg-3 align-items-center justify-content-between">
      <h2 class="text-title text-start d-inline mb-0" style="width: auto">The Latest Exchanged Post</h2>
      <div class="view-all">
        <a href="#">View all
          <span>
            <i class="far fa-long-arrow-right"></i>
          </span>
        </a>
      </div>
    </div>
    <div class="my-slider-2">
      <div class="slide-cover" style="max-height: 35rem; height: auto !important;">
        <div class="slide-boder" style="border: solid 2px var(--primary-color); border-radius: 1.2rem; ">
          <h3 class="the-latest-exchange-post-username pt-2"><span>Nhật Quang LNN</span> & <span>Uyên Trang</span></h3>
          <div class="the-latest-exchange-post-item-name">Successfully exchanged<span> Giày thể thao Thượng Đình
            </span>for <span> Tài khoản Nexflix</span>
            <div style="text-align: center; color: var(--text-sub-color); font-size: 0.875rem;;">23-05-2001</div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-5">
                <div class="card" style="margin: 12px 0;padding-bottom: 0.7rem;  border-radius: 1.2rem;">
                  <div class="latest-exchange-item-img"><img class="img-fluid"
                      src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt=""></div>
                  <div class="latest-exchange-user-img"><img src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg"
                      alt=""></div>
                  <div class="main-text">
                    <h2 class="latest-exchange-username">Nhat Quang LN</h2>
                    <h3 class="latest-exchange-title">TCP/IP and Advanced Topics of Quang</h3>
                    <div class="icon-progress progress-red" title="258/2335 likes">
                      <div class="icon-latest-post"><i class="far fa-heart"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 51.49201943095073%" role="progressbar"
                          style="width: 100%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-blue" title="258/2335 comments">
                      <div class="icon-latest-post"><i class="far fa-comment-alt-dots"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 60%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-gray" title="258/2335 views">
                      <div class="icon-latest-post"><i class="far fa-eye"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 80%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="div col-2 d-flex align-items-center justify-content-center">
                <span class="latest-exchange-handshake-icon" style="font-size: 3rem;"><i
                    class="far fa-handshake"></i></span>
              </div>
              <div class="col-5">
                <div class="card" style="margin: 12px 0;padding-bottom: 0.7rem;  border-radius: 1.2rem;">
                  <div class="latest-exchange-item-img"><img class="img-fluid"
                      src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt=""></div>
                  <div class="latest-exchange-user-img"><img src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg"
                      alt=""></div>
                  <div class="main-text">
                    <h2 class="latest-exchange-username">Nhat Quang LN</h2>
                    <h3 class="latest-exchange-title">TCP/IP and Advanced Topics of Quang</h3>
                    <div class="icon-progress progress-red" title="258/2335 likes">
                      <div class="icon-latest-post"><i class="far fa-heart"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 51.49201943095073%" role="progressbar"
                          style="width: 100%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-blue" title="258/2335 comments">
                      <div class="icon-latest-post"><i class="far fa-comment-alt-dots"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 60%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-gray" title="258/2335 views">
                      <div class="icon-latest-post"><i class="far fa-eye"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 80%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
      <div class="slide-cover" style="max-height: 35rem; height: auto !important;">
        <div class="slide-boder" style="border: solid 2px var(--primary-color); border-radius: 1.2rem; ">
          <h3 class="the-latest-exchange-post-username pt-2"><span>Nhật Quang LNN</span> & <span>Uyên Trang</span></h3>
          <div class="the-latest-exchange-post-item-name">Successfully exchanged<span> Giày thể thao Thượng Đình
            </span>for <span> Tài khoản Nexflix</span>
            <div style="text-align: center; color: var(--text-sub-color); font-size: 0.875rem;;">23-05-2001</div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-5">
                <div class="card" style="margin: 12px 0;padding-bottom: 0.7rem;  border-radius: 1.2rem;">
                  <div class="latest-exchange-item-img"><img class="img-fluid"
                      src="/DuniExchange/resource/img/product-img/dam-ngu-tre-em.jpg" alt=""></div>
                  <div class="latest-exchange-user-img"><img src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg"
                      alt=""></div>
                  <div class="main-text">
                    <h2 class="latest-exchange-username">Nhat Quang LN</h2>
                    <h3 class="latest-exchange-title">TCP/IP and Advanced Topics of Quang</h3>
                    <div class="icon-progress progress-red" title="258/2335 likes">
                      <div class="icon-latest-post"><i class="far fa-heart"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 51.49201943095073%" role="progressbar"
                          style="width: 100%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-blue" title="258/2335 comments">
                      <div class="icon-latest-post"><i class="far fa-comment-alt-dots"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 60%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-gray" title="258/2335 views">
                      <div class="icon-latest-post"><i class="far fa-eye"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 80%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="div col-2 d-flex align-items-center justify-content-center">
                <span class="latest-exchange-handshake-icon" style="font-size: 3rem;"><i
                    class="far fa-handshake"></i></span>
              </div>
              <div class="col-5">
                <div class="card" style="margin: 12px 0;padding-bottom: 0.7rem;  border-radius: 1.2rem;">
                  <div class="latest-exchange-item-img"><img class="img-fluid"
                      src="/DuniExchange/resource/img/product-img/AoNhieuMau.jfif" alt=""></div>
                  <div class="latest-exchange-user-img"><img src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg"
                      alt=""></div>
                  <div class="main-text">
                    <h2 class="latest-exchange-username">Nhat Quang LN</h2>
                    <h3 class="latest-exchange-title">TCP/IP and Advanced Topics of Quang</h3>
                    <div class="icon-progress progress-red" title="258/2335 likes">
                      <div class="icon-latest-post"><i class="far fa-heart"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 51.49201943095073%" role="progressbar"
                          style="width: 100%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-blue" title="258/2335 comments">
                      <div class="icon-latest-post"><i class="far fa-comment-alt-dots"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 60%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-gray" title="258/2335 views">
                      <div class="icon-latest-post"><i class="far fa-eye"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 80%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="slide-cover" style="max-height: 35rem; height: auto !important;">
        <div class="slide-boder" style="border: solid 2px var(--primary-color); border-radius: 1.2rem; ">
          <h3 class="the-latest-exchange-post-username pt-2"><span>Nhật Quang LNN</span> & <span>Uyên Trang</span></h3>
          <div class="the-latest-exchange-post-item-name">Successfully exchanged<span> Giày thể thao Thượng Đình
            </span>for <span> Tài khoản Nexflix</span>
            <div style="text-align: center; color: var(--text-sub-color); font-size: 0.875rem;;">23-05-2001</div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-5">
                <div class="card" style="margin: 12px 0;padding-bottom: 0.7rem;  border-radius: 1.2rem;">
                  <div class="latest-exchange-item-img"><img class="img-fluid"
                      src="/DuniExchange/resource/img/product-img/xinhDep.jpeg" alt=""></div>
                  <div class="latest-exchange-user-img"><img src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg"
                      alt=""></div>
                  <div class="main-text">
                    <h2 class="latest-exchange-username">Nhat Quang LN</h2>
                    <h3 class="latest-exchange-title">TCP/IP and Advanced Topics of Quang</h3>
                    <div class="icon-progress progress-red" title="258/2335 likes">
                      <div class="icon-latest-post"><i class="far fa-heart"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 51.49201943095073%" role="progressbar"
                          style="width: 100%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-blue" title="258/2335 comments">
                      <div class="icon-latest-post"><i class="far fa-comment-alt-dots"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 60%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-gray" title="258/2335 views">
                      <div class="icon-latest-post"><i class="far fa-eye"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 80%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="div col-2 d-flex align-items-center justify-content-center">
                <span class="latest-exchange-handshake-icon" style="font-size: 3rem;"><i
                    class="far fa-handshake"></i></span>
              </div>
              <div class="col-5">
                <div class="card" style="margin: 12px 0;padding-bottom: 0.7rem;  border-radius: 1.2rem;">
                  <div class="latest-exchange-item-img"><img class="img-fluid"
                      src="/DuniExchange/resource/img/product-img/tui-deo-cheo-di-choi-03.jpg" alt=""></div>
                  <div class="latest-exchange-user-img"><img src="/DuniExchange/resource/img/avatar/DE150066_LuongNguyenNhatQuang_2.jpg"
                      alt=""></div>
                  <div class="main-text">
                    <h2 class="latest-exchange-username">Nhat Quang LN</h2>
                    <h3 class="latest-exchange-title">TCP/IP and Advanced Topics of Quang</h3>
                    <div class="icon-progress progress-red" title="258/2335 likes">
                      <div class="icon-latest-post"><i class="far fa-heart"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 51.49201943095073%" role="progressbar"
                          style="width: 100%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-blue" title="258/2335 comments">
                      <div class="icon-latest-post"><i class="far fa-comment-alt-dots"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 60%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                    <div class="icon-progress progress-gray" title="258/2335 views">
                      <div class="icon-latest-post"><i class="far fa-eye"></i></div>
                      <div class="progress w-75" style="height: 5px">
                        <div class="progress-bar bg-danger" style="width: 80%" role="progressbar" style="width: 100%"
                          aria-valuenow="36" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- footer import -->
    <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>
  <!-- footer import -->

  <!-- tiny slider -->
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.2/min/tiny-slider.js"></script> -->
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
</body>

</html>
