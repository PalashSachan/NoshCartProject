<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="NoshCart.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    
        .auto-style21 {
            height: 308px;
            width: 344px;
        }
        .auto-style22 {
            height: 236px;
            width: 236px;
        }
    
    </style>
    
    <link href="CSS/home.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />

    <link href="CSS/style_home.css" rel="stylesheet" />
    
    <script type="text/javascript" src="engine1/wowslider.js"></script>
    <script type="text/javascript" src="engine1/script.js"></script>
    <script type="text/javascript" src="engine1/jquery.js"></script>
    
<%--    <script src="Scripts/jquery_home.js"></script>
    <script src="Scripts/camera.min.home.js"></script>
    <script src="Scripts/jquery_home.1.3.js"></script>--%>

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
        <!---start-content---->
        <div class="main">
            <div class="wrap">
                <!---728x90--->
                <div class="welcome_desc">
                    <div class="section group">
                        <div class="col_1_of_2 span_1_of_2">
                            <h3>Welcome to The
                                <br>
                                <span>Delicious NoshCart</span></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                            <a href="#" class="button">Read More</a>
                        </div>
                        <div class="col_1_of_2 span_1_of_2">
                            <div class="grid_img">
                                <img src="ProductImage/ef4d2c60a6041b3ced6a768cd8ad9783.jpg" class="auto-style21" />
                            </div>
                            <div class="price_desc">
                                <a href="#">
                                    <div class="price">₹50</div>
                                    <div class="price_text">
                                        <h4><span>Today Special</span>Thali</h4>
                                    </div>
                                    <div class="clear"></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!---728x90--->
            <div class="items_desc">
                <div class="wrap">
                    <div class="section group">
                        <div class="listview_1_of_2 images_1_of_2">
                            <div class="listimg listimg_2_of_1">
                                <a href="#">
                                    <img src="ProductImage/498c4308b861ced8b8465ecdb298230a.jpg" class="auto-style22" /><span>₹45</span></a>
                            </div>
                            <div class="text list_2_of_1">
                                <h3>Hakka Noodles</h3>
                                <p>Delicious Hakka Noodles</p>
                                <div class="read_more"><a href="#">Read More</a></div>
                            </div>
                        </div>
                        <div class="listview_1_of_2 images_1_of_2">
                            <div class="listimg listimg_2_of_1">
                                <a href="#">
                                    <img src="ProductImage/751e0ca1151adf16123ecfd32847c388.jpg" class="auto-style22" /><span>₹50</span></a>
                            </div>
                            <div class="text list_2_of_1">
                                <h3>Burger</h3>
                                <p>Veg Burger</p>
                                <div class="read_more"><a href="#">Read More</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="section group">
                        <div class="listview_1_of_2 images_1_of_2">
                            <div class="listimg listimg_2_of_1">
                                <a href="#">
                                    <img src="ProductImage/d59511bc22fefb9818b047d25d35e90b.jpg" class="auto-style22" /><span>₹35</span></a>
                            </div>
                            <div class="text list_2_of_1">
                                <h3>Paneer Seekh Kabab</h3>
                                <p>Paneer Kabab</p>
                                <div class="read_more"><a href="#">Read More</a></div>
                            </div>
                        </div>
                        <div class="listview_1_of_2 images_1_of_2">
                            <div class="listimg listimg_2_of_1">
                                <a href="#">
                                    <img src="ProductImage/eec52c3f108b814994247f909f76a4e7.jpg" class="auto-style22" /><span>₹40</span></a>
                            </div>
                            <div class="text list_2_of_1">
                                <h3>Thali</h3>
                                <p>Veg Indian Thali</p>
                                <div class="read_more"><a href="#">Read More</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---728x90--->
            <div class="content_bottom">
                <div class="wrap">
                    <div class="section group">
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Our Chefs</h3>
                            <img src="Image/Home/chefs.jpg" alt="" />
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            <div class="read_more"><a href="#">Read More</a></div>
                        </div>
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Special Dishes </h3>
                            <ul class="dishes_list">
                                <li><a href="#">Burger</a></li>
                                <li><a href="#">Hakka Noodles</a></li>
                                <li><a href="#">Paneer Seekh Kabab</a></li>
                                <li><a href="#">Dosa</a></li>
                                <li><a href="#">Veg Roll</a></li>
                                <li><a href="#">Chicken Kabab</a></li>
                                <li><a href="#">Idli</a></li>
                                <li><a href="#">Deluxe Thali</a></li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <div class="col_1_of_3 span_1_of_3">
                            <div class="location">
                                <h3>Location</h3>
                                <ul>
                                    <li>Kanpur</li>
                                    <li>Uttar Pradesh</li>
                                    <li></li>
                                    <li><a href="mailto:palashsachan@gmail.com">palashsachan@gmail.com</a></li>
                                    <li><span>Mobile :</span> +91 995 6551996</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>	
    </div>
</asp:Content>
