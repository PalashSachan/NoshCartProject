<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="NoshCart.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    
    </style>
    <link href="CSS/home.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
    <script type="text/javascript" src="engine1/wowslider.js"></script>
    <script type="text/javascript" src="engine1/script.js"></script>
    <script type="text/javascript" src="engine1/jquery.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
            <div id="wowslider-container1">
                <div class="ws_images">
                    <ul>
                        <li>
                            <img src="Image/Slider/images/baconrolls1344842.jpg" alt="bacon-rolls-1344842" title="bacon-rolls-1344842" id="wows1_0" /></li>
                        <li>
                            <img src="Image/Slider/images/chicken_skewerswallpaper1366x768.jpg" alt="chicken_skewers-wallpaper-1366x768" title="chicken_skewers-wallpaper-1366x768" id="wows1_1" /></li>
                        <li>
                            <img src="Image/Slider/images/dessert1079759.jpg" alt="dessert-1079759" title="dessert-1079759" id="wows1_2" /></li>
                        <li>
                            <img src="Image/Slider/images/food715542.jpg" alt="food-715542" title="food-715542" id="wows1_3" /></li>
                        <li>
                            <img src="Image/Slider/images/spaghetti660748.jpg" alt="jquery slideshow" title="spaghetti-660748" id="wows1_4" /></a></li>
                        <li>
                            <img src="Image/Slider/images/sushi491425.jpg" alt="sushi-491425" title="sushi-491425" id="wows1_5" /></li>
                    </ul>
                </div>
                <div class="ws_bullets">
                    <div>
                        <a href="#" title="bacon-rolls-1344842"><span>
                            <img src="Image/Slider/tooltips/baconrolls1344842.jpg" alt="bacon-rolls-1344842" />1</span></a>
                        <a href="#" title="chicken_skewers-wallpaper-1366x768"><span>
                            <img src="Image/Slider/tooltips/chicken_skewerswallpaper1366x768.jpg" alt="chicken_skewers-wallpaper-1366x768" />2</span></a>
                        <a href="#" title="dessert-1079759"><span>
                            <img src="Image/Slider/tooltips/dessert1079759.jpg" alt="dessert-1079759" />3</span></a>
                        <a href="#" title="food-715542"><span>
                            <img src="Image/Slider/tooltips/food715542.jpg" alt="food-715542" />4</span></a>
                        <a href="#" title="spaghetti-660748"><span>
                            <img src="Image/Slider/tooltips/spaghetti660748.jpg" alt="spaghetti-660748" />5</span></a>
                        <a href="#" title="sushi-491425"><span>
                            <img src="data1/tooltips/sushi491425.jpg" alt="sushi-491425" />6</span></a>
                    </div>
                </div>
            </div>
        </div>

        <div align="center" style="background-color: grey">
            <a href="Menu">
                <img src="Image/menu.png" />
            </a>
        </div>
    </div>
</asp:Content>
