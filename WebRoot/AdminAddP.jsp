<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品上架</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jQuery.js"></script>
<script src="js/bootstrap.min.js"></script>


	<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
.comWidth{width:900px;margin-left:auto;margin-right:auto;}
.comWidth1{width:1090px;margin-left:auto;margin-right:auto;}
.quanping{width:auto;height:1100px;margin-left:auto;margin-right:auto;background-color:#FFE3E3;}
.fr{float:right;}
.fl{float:left;}
.hide{display:none;}
.show{display:block;}
.top{height:31px;width:100%;background-color:#F9F9F9 ;line-height:31px;}
.top a:hover{color:red;}
.login{font-weight:bold;}
.leftarea{font-weight:bold;}
.logo{height:108px;background-color:#EA0000;}
/*.logoimage{padding-top:8px;}*/
body,ul,li,p,h3,div{margin:0;padding:0;}
body{font-size:12px;}
img{border:none;}
li{list-style:none;}
input{border:none;}
hr{color:#FFF;}
dt{padding-left:10px;paddind-top:5px;}
/*dl{border-bottom:1px solid #FFF;}*/
a{text-decoration:none;color:#666;}
.navbox{height:36px;background-color:#FF4848;color:#FFF; }
.nav,shopclass p{font-family:"Microsoft YaHei","微软雅黑";}
.nav{line-height:35px;}
.nav li{float:left;}
.nav a{height:36px;display:inline-block;padding:0 60px;color:#FFF; }
.nav a:hover{color:black;}
.nav .active{background-color:#FF9D9D;}
.form .col-xs-4{margin-left:400px;}
.form .col-xs-5{margin-left:420px;}
.formm{margin-left:415px;}
.form .formtext{margin-left:3px;}
.form .formtext2{padding-left:10px;}
.table{width:900px;margin-left:auto;margin-right:auto;}
.btn {
	-moz-box-shadow: 0px 10px 14px -7px #bd4c4c;
	-webkit-box-shadow: 0px 10px 14px -7px #bd4c4c;
	box-shadow: 0px 10px 14px -7px #bd4c4c;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f27e7e), color-stop(1, #f76868));
	background:-moz-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:-webkit-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:-o-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:-ms-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:linear-gradient(to bottom, #f27e7e 5%, #f76868 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f27e7e', endColorstr='#f76868',GradientType=0);
	background-color:#f27e7e;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:11px;
	padding:11px 23px;
	text-decoration:none;
	text-shadow:0px 1px 0px #f06c73;
}
.btn:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f76868), color-stop(1, #f27e7e));
	background:-moz-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:-webkit-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:-o-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:-ms-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:linear-gradient(to bottom, #f76868 5%, #f27e7e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f76868', endColorstr='#f27e7e',GradientType=0);
	background-color:#f76868;
}
.btn:active {
	position:relative;
	top:1px;
}
</style>


  </head>
  <script type="text/javascript">
  function getUser(){
     location.href="http://localhost:8080/shopping/Admin_getUser.action";
  }
   function check() {
	      if(confirm("您确定要退出吗?")){
		        window.location.href = "Homepage.jsp"
	           }
	           }
	           
function previewImage(file)
        {
        	var f=file.files;
          if(f[0].size>2097152){
			file.outerHTML=file.outerHTML; 
    		alert("有大小超过2Mb的图片！请重新选择！"); 
    		return;
    	}
          var MAXWIDTH  = 90; 
          var MAXHEIGHT = 90;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else{
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }

  </script>
  
  <body>
  <div class="quanping">
  <div class="top">
    <div class="comWidth">
      <div class="leftarea fl"> 欢迎来到嗨购! </div>
      <div class="rightarea fr"> 
         <a onclick="check()" class="register">退出登录</a> 
      </div>
    </div>
 </div>
 
  <div class="logo">
    <div class="comWidth1">
      <div class="logoimage fl"> <a href="#"><img src="image/haigou.png" alt="嗨购"></a> </div>
    </div>
  </div>
  
  <div class="formm">
    <label  class="name">商品名 ：</label>
    <input type="text" class="formtext" onfocus="" id="pname" name="pname" style="margin-top: 7px;height: 30px;" >
  </div>
  <div class="formm">
  <label class="name">价 格 ：</label>
    <input type="number" class="formtext2" onfocus="" id="price" name="price" style="margin-top: 7px;height: 30px;" >
</div>
  <div class="formm">
  <label class="name">库 存 ：</label>
    <input type="number" class="formtext2" onfocus="" id="inventory" name="inventory" style="margin-top: 7px;height: 30px;" >
</div>
  <div class="formm">
  <label class="name">商品类别：</label>
  <input type="checkbox" value="手机" />手机
  <input type="checkbox" value="电脑" />电脑
  </div>



<div id="addCommodityIndex" class="form">
<label for="sKnot" class="col-xs-4 control-label">商品主图：</label>
<div id="preview" class="col-xs-5" style="text-align:left;">
<img class="img" id="imghead" border="0" src="image/photo_icon.png" style="margin-top:2px" width=90 height=90
	onclick="$('#previewImg').click();">
</div>
<input type="file" onchange="previewImage(this)" name="mainpic" style="display: none;margin-top:-29px" accept="image/*" id="previewImg"
required="required"  >
</div>



<div class="form">
	<div><label for="sKnot" class="col-xs-4 control-label">商品细节图：</label>
    </div>
	<div class="col-xs-5">
		<input style="margin-top:1px" type="file" name="detimgUpload" accept="image/*" id="imgUpload" onchange="cheakfile(this)" multiple>
	</div>
</div>

							<script>
							function cheakfile(value){
								var files=value.files, fs=files.length, s=0;
								if(fs >5 ){
									value.outerHTML=value.outerHTML; 
    								alert("上传的文件数量超过10个了！请重新选择！"); 
    								return;   
								}
								for(var i=0;i<fs;i++){
									if(files[i].size>2097152){
									value.outerHTML=value.outerHTML; 
    								alert("有大小超过2Mb的图片！请重新选择！"); 
    								return;
									}
								}
								
						}
							</script>

<div class="form">
<label for="sKnot" class="col-xs-4 control-label">商品详情：</label>
<div class="col-xs-5">
	<textarea placeholder="对商品的描述" name="gdetails" maxlength="200"style="width: 350px; height: 200px;float:left;margin-top:1px"></textarea>
</div>
</div>


<div class="form">
<label for="sKnot" class="col-xs-4 control-label">商品说明：</label>
<div class="col-xs-5">
<textarea placeholder="商品细节的详细说明" name="gexplain" maxlength="200" style="width: 350px; height: 200px;float:left;margin-top:1px"></textarea>
</div>
</div>

<div class="form">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 200px;">
									<button type="reset" class="btn btn-xs btn-white fr">取 消</button>
									<button type="submit" class="btn btn-xs btn-green fr" >保 存 </button>
								</div>
							</div>


    </div>
    <script src="js/jquery.nouislider.js"></script>
	<script type="text/javascript">
	function cheakLoginOrNot() { 
      
        /* location.href=""; */
    } 
} 
	
	</script>
    
  </body>
<script type="text/javascript">
$('#test').diyUpload({

	url:'#',

	success:function( data ) {

		console.info( data );

	},

	error:function( err ) {

		console.info( err );	

	}

});
</script>
</html>
