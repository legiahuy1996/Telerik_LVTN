<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TelerikWebApp1.Login" %>
<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
	<!DOCTYPE html>
	<html>
	<head>
		<title>Chào mừng bạn đến với trang đăng nhập thuế</title>
		<link rel="stylesheet" href="css/style.css">
		<link href='//fonts.googleapis.com/css?family=Josefin+Sans:400,300italic,300,100italic,100,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700' rel='stylesheet' type='text/css'>
		<!-- For-Mobile-Apps-and-Meta-Tags -->
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="keywords" content="Plain Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
			<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!-- //For-Mobile-Apps-and-Meta-Tags -->
       <script src="Content/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <link href="Content/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />
    <script src="Content/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="Content/notify.min.js"></script>
	</head>
	<body>

	
	<!---728x90--->
	<script src='//publisher.eboundservices.com/dynamicAds/dynamicScript.js'></script>
	<div style='margin: 0 auto;text-align: center;margin-top: 5px;'><script>
	var allowedNumberOfEboundDynamicAdds = 4;
	var sizesEboundDynamicAdsDesktop = ['728x90'];
	var sizesEboundDynamicAdsTablet = ['728x90'];
	var sizesEboundDynamicAdsMobile = ['320x100'];
	eboundAdsTagByDevice(sizesEboundDynamicAdsDesktop,sizesEboundDynamicAdsTablet,sizesEboundDynamicAdsMobile, 'ebound_header_tag');

	if(typeof user_tag_config == 'undefined'){
		var user_tag_config = {};
	}
	user_tag_config['ebound_header_tag'] = {};
	user_tag_config['ebound_header_tag']['desktop'] = {};
	user_tag_config['ebound_header_tag']['desktop']['cpm'] = '';
	user_tag_config['ebound_header_tag']['desktop']['adsCode'] = '';
	user_tag_config['ebound_header_tag']['tablet'] = {};
	user_tag_config['ebound_header_tag']['tablet']['cpm'] = '';
	user_tag_config['ebound_header_tag']['tablet']['adsCode'] = '';
	user_tag_config['ebound_header_tag']['mobile'] = {};
	user_tag_config['ebound_header_tag']['mobile']['cpm'] = '';
	user_tag_config['ebound_header_tag']['mobile']['adsCode'] = '';
	</script></div>
	   <div class="main">
	   <h2>Đăng nhập tài khoản</h2>
		   <form runat="server">
				<asp:TextBox runat="server" ID="txtTaiKhoan" placeholder="Tên đăng nhập"></asp:TextBox>
               <asp:TextBox TextMode="Password" runat="server" ID="txtMatKhau" placeholder="Mật khẩu"></asp:TextBox>
                 <%-- <a href="QuenMatKhau.aspx"> Quên mật khẩu</a>--%>
				<asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Đăng nhập"/>
              
			</form>	
         
	   </div>
	   <div class="footer">
	   <!---728x90--->
	<script src='//publisher.eboundservices.com/dynamicAds/dynamicScript.js'></script>
	<div style='margin: 0 auto;text-align: center;margin-top: 5px;'><script>
	var allowedNumberOfEboundDynamicAdds = 4;
	var sizesEboundDynamicAdsDesktop = ['728x90'];
	var sizesEboundDynamicAdsTablet = ['728x90'];
	var sizesEboundDynamicAdsMobile = ['320x100'];
	eboundAdsTagByDevice(sizesEboundDynamicAdsDesktop,sizesEboundDynamicAdsTablet,sizesEboundDynamicAdsMobile, 'ebound_header_tag');

	if(typeof user_tag_config == 'undefined'){
		var user_tag_config = {};
	}
	user_tag_config['ebound_header_tag'] = {};
	user_tag_config['ebound_header_tag']['desktop'] = {};
	user_tag_config['ebound_header_tag']['desktop']['cpm'] = '';
	user_tag_config['ebound_header_tag']['desktop']['adsCode'] = '';
	user_tag_config['ebound_header_tag']['tablet'] = {};
	user_tag_config['ebound_header_tag']['tablet']['cpm'] = '';
	user_tag_config['ebound_header_tag']['tablet']['adsCode'] = '';
	user_tag_config['ebound_header_tag']['mobile'] = {};
	user_tag_config['ebound_header_tag']['mobile']['cpm'] = '';
	user_tag_config['ebound_header_tag']['mobile']['adsCode'] = '';
	</script></div>
	<!---728x90--->
	<script src='//publisher.eboundservices.com/dynamicAds/dynamicScript.js'></script>
	<div style='margin: 0 auto;text-align: center;margin-top: 5px;'><script>
	var allowedNumberOfEboundDynamicAdds = 4;
	var sizesEboundDynamicAdsDesktop = ['728x90'];
	var sizesEboundDynamicAdsTablet = ['728x90'];
	var sizesEboundDynamicAdsMobile = ['320x100'];
	eboundAdsTagByDevice(sizesEboundDynamicAdsDesktop,sizesEboundDynamicAdsTablet,sizesEboundDynamicAdsMobile, 'ebound_header_tag');

	if(typeof user_tag_config == 'undefined'){
		var user_tag_config = {};
	}
	user_tag_config['ebound_header_tag'] = {};
	user_tag_config['ebound_header_tag']['desktop'] = {};
	user_tag_config['ebound_header_tag']['desktop']['cpm'] = '';
	user_tag_config['ebound_header_tag']['desktop']['adsCode'] = '';
	user_tag_config['ebound_header_tag']['tablet'] = {};
	user_tag_config['ebound_header_tag']['tablet']['cpm'] = '';
	user_tag_config['ebound_header_tag']['tablet']['adsCode'] = '';
	user_tag_config['ebound_header_tag']['mobile'] = {};
	user_tag_config['ebound_header_tag']['mobile']['cpm'] = '';
	user_tag_config['ebound_header_tag']['mobile']['adsCode'] = '';
	</script></div> 
	 </div>
	</body>
	</html>