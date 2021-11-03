<%-- 
    Document   : managerProduct
    Created on : Oct 22, 2021, 1:18:34 PM
    Author     : truon
--%>
<%@page import="Entity.Post" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <jsp:include  page="/jsp/importer/base-css.jsp"></jsp:include>
<title>Manager Post</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/DuniExchange/resource/css/bootstrapCheck.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="/DuniExchange/resource/css/styleCheck.css">
<!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">-->
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">-->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->
<!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
<!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>-->
<!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>-->
<style>
body {
    color: #404E67;
    background: white;
    font-family: "Noto Sans", sans-serif !important;
}
.table-wrapper {
    width: 80%px;
    margin: 30px auto;
    background: #w;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #fd5631;

}
table.table td .add {
    display: none;
}
</style>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    var actions = $("table td:last-child").html();
    
    // Append table with add row form on add new button click
    $(".add-new").click(function(){
        $(this).attr("disabled", "disabled");
        var index = $("table tbody tr:last-child").index();
        var row = '<tr>' +
            '<td></td>' +
            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
            '<td></td>'+            
            '<td></td>'+
            '<td>' + actions + '</td>' +
            '</tr>';
    
    	$("table").append(row);		
            $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });
    
	// Add row on add button click
    $(document).on("click", ".add", function(){
        var empty = false;
        var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
            if(!$(this).val()){
                $(this).addClass("error");
                empty = true;
            } else{
                $(this).removeClass("error");
            }   
        });
        
        $(this).parents("tr").find(".error").first().focus();
        
        if(!empty){
            input.each(function(){
                $(this).parent("td").html($(this).val());
            });
            
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").removeAttr("disabled");
        }		
    });
    
    // Edit row on edit button click
    $(document).on("click", ".edit", function(){
        // $(this).parents("tr").find("td:not(:last-child)").each(function(){
        $(this).parents("tr").find("td:not(:last-child, .Boqua)").each(function(){
            $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
        });
        
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");
    });
    
    // Delete row on delete button click
    $(document).on("click", ".delete", function(){
        $(this).parents("tr").remove();
        $(".add-new").removeAttr("disabled");
    });
});
</script>
</head>
<body>
    <jsp:include page="/jsp/importer/header.jsp"></jsp:include>                

    <div class="container-lg"  style="width: 100%;">
        <div class="table-responsive" >
            <div class="table-wrapper" >
            </div>
        </div>
    </div>
<div class="container-lg">
        <div class="table-responsive">
        <div class="table-wrapper" style="word-wrap: break-word;  text-align: center;">
            
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-3"><h2>Manager <b style="color: #fd5631">Post</b></h2></div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr style="word-wrap: initial; text-align: center;">
                        <th style="width: 5%;">ID</th>
                        <th style="width: 10%;">Owner</th>
                        <th style="width: 25%;" >postTitle</th>
                        <th style="width: 35%;">postDescription</th>
                        <th  style="width: 8%;">Thumnail</th>
                        <th  style="width: 8%;">postLike</th>
                        <th>isDisable</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${lPost}" var="o">
                    <tr>
                        <td class="Boqua">${o.postID}</td>
                        <td>${o.postUsername}</td>
                        <td>${o.postTitle}</td>
                        <td>${o.postDescription}</td>
                        <td class="Boqua"><img width="48px" height="48px"
                            src="${o.postThumbnailURL}" alt="${currentAccount.userUsername}">
                        </td>
                        <td>${o.postLike}</td>
                        <td class="Boqua">                  
                        <label class="custom-control ios-switch">
                            <input type="checkbox" class="ios-switch-control-input"  <c:if test="${o.isDisable==true}"> checked=""</c:if> onclick="location.href = 'changePostState?pID=${o.postID}&state=${o.isDisable}'">
                            <span class="ios-switch-control-indicator"></span>
                        </label>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>   
    <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>     

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