<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

    <!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 font-size-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="index.html">Home</a>
              </li>
              <li class="breadcrumb-item active">
                Member
              </li>
              <li class="breadcrumb-item active">
                My Purchase List
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

    <!-- CONTENT -->
    <section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">

            <!-- Heading -->
            <h3 class="mb-10">My Purchase List</h3>

          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-3">

            <!-- Nav -->
            <nav class="mb-10 mb-md-0">
              <div class="list-group list-group-sm list-group-strong list-group-flush-x">
              <a class="list-group-item list-group-item-action dropright-toggle active" href="/member/mypage">
                  배송현황
                </a>
                <a class="list-group-item list-group-item-action dropright-toggle active" href="/member/modifyMemberInfo">
                  회원 정보 수정
                </a>
                <a class="list-group-item list-group-item-action dropright-toggle" href="/member/purchaseList">
                  구매목록
                </a>
                <a class="list-group-item list-group-item-action dropright-toggle" href="/payment/shopcart">
                  장바구니
                </a>           
                 <a class="list-group-item list-group-item-action dropright-toggle" href="/member/">
                  회원 탈퇴
                </a>
              </div>
            </nav>
            <!-- 옆메뉴 종료 -->

          </div>
          <div class="col-12 col-md-9 col-lg-8 offset-lg-1">

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order No:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                          673290789
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                          <time datetime="2019-10-01">
                            01 Oct, 2019
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Status:</h6>

                        <!-- Text -->
                        <p class="mb-0 font-size-sm font-weight-bold">
                          Awating Delivery
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>

                        <!-- Text -->
                        <p class="mb-0 font-size-sm font-weight-bold">
                          $259.00
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">
                <div class="row align-items-center">
                  <div class="col-12 col-lg-6">
                    <div class="form-row mb-4 mb-lg-0">
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-5.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-112.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-7.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-light">
                          <a class="embed-responsive-item embed-responsive-item-text text-reset" href="#!">
                            <div class="font-size-xxs font-weight-bold">
                              +2 <br> more
                            </div>
                          </a>
                        </div>

                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="form-row">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm btn-block btn-outline-dark" href="/member/mypageOrderDetail">
                          Order Details
                        </a>

                      </div>
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm btn-block btn-outline-dark" href="#!">
                          Track order
                        </a>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order No:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                          871090437
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                          <time datetime="2019-09-25">
                            25 Sep, 2019
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Status:</h6>

                        <!-- Text -->
                        <p class="mb-0 font-size-sm font-weight-bold">
                          In Processing
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>

                        <!-- Text -->
                        <p class="mb-0 font-size-sm font-weight-bold">
                          $75.00
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">
                <div class="row align-items-center">
                  <div class="col-12 col-lg-6">
                    <div class="form-row mb-4 mb-lg-0">
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-11.jpg);"></div>

                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="form-row">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm btn-block btn-outline-dark" href="account-order.html">
                          Order Details
                        </a>

                      </div>
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm btn-block btn-outline-dark" href="#!">
                          Track order
                        </a>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order No:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                          891230563
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 font-size-sm font-weight-bold">
                          <time datetime="2019-09-07">
                            07 Sep, 2019
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Status:</h6>

                        <!-- Text -->
                        <p class="mb-0 font-size-sm font-weight-bold">
                          Delivered
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>

                        <!-- Text -->
                        <p class="mb-0 font-size-sm font-weight-bold">
                          $69.00
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">
                <div class="row align-items-center">
                  <div class="col-12 col-lg-6">
                    <div class="form-row mb-4 mb-lg-0">
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-14.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(assets/img/products/product-15.jpg);"></div>

                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="form-row">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm btn-block btn-outline-dark" href="account-order.html">
                          Order Details
                        </a>

                      </div>
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm btn-block btn-outline-dark" href="#!">
                          Track order
                        </a>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <!-- Pagination -->
            <nav class="d-flex justify-content-center justify-content-md-end mt-10">
              <ul class="pagination pagination-sm text-gray-400">
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <i class="fa fa-caret-left"></i>
                  </a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#">1</a>
                </li>
        
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <i class="fa fa-caret-right"></i>
                  </a>
                </li>
              </ul>
            </nav>

          </div>
        </div>
      </div>
    </section>

<%@ include file="../includes/footer.jsp" %>