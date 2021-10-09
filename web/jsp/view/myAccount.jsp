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
  <link rel="stylesheet" href="/DuniExchange/resource/css/my-account.css">
  <title>Document</title>
</head>

<body>
    <!-- header import -->
    <jsp:include page="/jsp/importer/header.jsp"></jsp:include>
    <!-- header import -->
    
<!--main body-->
    <div class="d-flex flex-column" id="general-container">
        <div class="" id="avatar-display">
             <div class="something"></div>
        </div>

        <div class="d-flex" id="body-section">
            <div class="" id="information-display">
                <div class="something"></div>
            </div>
            <div class="" id="function-display">
                <div class="something"></div>
            </div>
        </div>
    </div>

  <!-- footer import -->
    <jsp:include page="/jsp/importer/footer.jsp"></jsp:include>
  <!-- footer import -->
  
  <jsp:include page="/jsp/importer/base-js.jsp"></jsp:include>
</body>

</html>
