const Vue = require('vue')


const app = new Vue({
    data: {
        //开始的标题推荐语言
            titles:[
           
            ],
            searchValue:"",
        //推荐热门宠物
            recomend:[
                {
                    name:'1',
                    des:"akjdhfkjdhfkja",
                    imgUrl:"images/2.jpg"
                },
                {
                    name:'2',
                    des:"adsjhfkasjdhfksjdf",
                    imgUrl:"images/3.jpg"
                },
        
            ],
        //推荐热销宠物
            hot:{
                name:'hot',
                    des:"adsjhfkasjdhfksjdf",
                    imgUrl:"images/4.jpg"
            }
        
		  },
		  
		  mounted() {
			  console.log("mounted")
		  },
          created(){
			  self = this;
			var request = require("request");

			var options = { method: 'GET',
			  url: 'http://localhost:8090/getMain',
			  headers: 
			   { 'postman-token': 'add03b86-9198-c19a-ce8a-e90ba5e909d5',
				 'cache-control': 'no-cache',
				 'content-type': 'application/json' },
			  body: 
			   { 
				  },
			  json: true };
			
			request(options, function (error, response, body) {
			  if (error) throw new Error(error);
			
			  temp =body.data.result;
			  for(var i =0; i < temp.length; i++){

				self.titles.push( {	main:temp[i].mainT,
                little:temp[i].littleT
            })
			  }


			});

			


              //打印好玩
             // console.log("|¯¯¯¯|\¯¯¯¯\   /¯¯¯¯/\¯¯¯¯\' /¯¯¯¯/|¯¯¯¯|\¯¯¯¯\                /¯¯¯¯/|¯¯¯¯|  /¯¯¯¯/|¯¯¯¯|\¯¯¯¯\   /¯¯¯¯/\¯¯¯¯\' |¯¯¯¯|\¯¯¯¯\   /¯¯¯¯/\¯¯¯¯\'\n|::...::|/____/|° \____\_¯¯¯¯|\____\|::....:|/____/|'               \___ '\|____|  |\____\|::....:|/____/|' '|::..  .|  |...::::| |.:::...|/____/   \____\_¯¯¯¯\n|.::....|'____|/  /¯¯¯¯/¯____'\|;;;;;;;'|:::... |';;;;;;;|/               |¯¯¯¯|\  ¯¯¯\' '\|;;;;;;;'|:::... |';;;;;;;|/ '|.::::. |  |::: ...| |::::...|\¯¯¯¯\   /¯¯¯¯/¯____\n|____|           |\____\/____/|   ¯¯¯¯|____|¯¯¯¯                 |____|/____/|    ¯¯¯¯|____|¯¯¯¯   |\____\/____/| |____| |____|' |\____\/____/|\n|;;;;;;;|          | |;;;;;;;;;;;;;;;|'|          |;;;;;;;|                         |;;;;;;;;;;;;;;;'|'|           |;;;;;;;|           |'|;;;;;;;;;;;;;;;'|'| |;;;;;;;||'|;;;;;;;|°| |;;;;;;;;;;;;;;;|'|\n|____|          '\|________ '|/          |____|                        |_________|/           |____|          \|_________|/°|____|\|____|' '\|________ '|\n/%c 👉 PetStore 👈 %c https://localhost:3000 %c BY Lwl  \n\n","color:#fff;background:rgb(54, 110, 187);padding:5px 0;","background:rgba(197, 197, 197, 0.89); padding:5px 0;","color: rgb(157, 208, 251); background: rgb(37, 36, 35); padding:5px 0;");
              //载入值
        
          },
          methods:{
              clickAdd(){
                  console.log('click add button')
                      console.log('load');
                    
              },
              search(){
                  console.log(this.searchValue)
                    window.location.href="search?search="+this.searchValue;   
              }
        
          },
          



    template: `
    <div id='app'>
	<!-- //copyright -->
	<script src='js/responsiveslides.min.js'></script>
	<script src='js/SmoothScroll.min.js'></script>
	<script type='text/javascript' src='js/move-top.js'></script>
	<script type='text/javascript' src='js/easing.js'></script>
		<!-- here stars scrolling icon -->
	<script type='text/javascript'>
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- banner -->
	<div class='banner'>
		<div class='header'>
			<div class='container'>
				<div class='header-left'>
					<div class='w3layouts-logo'>
						<h1>
							<a href='index.html'>Pet <span>Store</span></a>
						</h1>
					</div>
				</div>
				<div class='header-right'>
					<div class='top-nav'>
						<nav class='navbar navbar-default'>
								<div class='navbar-header'>
									<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1'>
										<span class='sr-only'>Toggle navigation</span>
										<span class='icon-bar'></span>
										<span class='icon-bar'></span>
										<span class='icon-bar'></span>
									</button>
								</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>
								<ul class='nav navbar-nav'>
									<li><a class='active' href='main'>主页</a></li>

																	
									<li><a href='clasify'>分类</a></li>
									<li><a  href='user'>个人</a></li>
									<li><a  href='http://localhost:3001/cart'>购物车</a></li>
									<li><a  href='http://localhost:3001/login'>卖家</a></li>
									<li><a  href='/login'>注销</a></li>

														
								</ul>	
								<div class='clearfix'> </div>
							</div>	
						</nav>		
					</div>
				<div class='agileinfo-social-grids'>
						
							  <div class='col-lg-6' style='width:300px'>
								<div class='input-group'>
								<input type='text' class='form-control' id='searchV' placeholder='请输入搜索内容' v-model:value='searchValue'>
								<span class='input-group-btn'>
									<button class='btn btn-default' id='search' type='button' v-on:click='search'>搜索</button>
								</span>
								</div><!-- /input-group -->
							</div><!-- /.col-lg-6 -->
					</div>
			<div class='clearfix'> </div>
				</div>
				<div class='clearfix'> </div>
			</div>
		</div>
		<div class='w3layouts-banner-slider'>
			<div class='container'>
				<div class='slider'>
					<div class='callbacks_container'>
						<ul class='rslides callbacks callbacks1' id='slider4'>
							<li  v-for='title in titles'>
								<div class='agileits-banner-info'>
									<h3>{{title.main}} <span>{{title.little}}</span></h3>
									<div class='w3-button'>
										<a href='single.html'>More</a>
									</div>
								</div>
							</li>
						
						</ul>
					</div>
					<script src='js/responsiveslides.min.js'></script>
					<script>
						// You can also use '$(window).load(function() {'
						$(function () {
						  // Slideshow 4
						  $('#slider4').responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 500,
							namespace: 'callbacks',
							before: function () {
							  $('.events').append('<li>before event fired.</li>');
							},
							after: function () {
							  $('.events').append('<li>after event fired.</li>');
							}
						  });
					
						});
					 </script>
					<!--banner Slider starts Here-->
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<div class='tlinks'>Collect from <a href='http://www.cssmoban.com/'  title='网站模板'>网站模板</a></div>
	<!-- banner-bottom -->
	<div class='welcome'>
		<div class='container'>
			<div class='w3ls-heading'>
				<h2>Welcome To Our Pet Store</h2>
			</div>
			<div class='welcome-grids'>
				<div class='col-md-6 agile-welcome-grid'>
					<div class='grid'>
						<div class='col-md-6 agileits-left' v-for='item in recomend'>
							<figure class='effect-chico'>
								<img :src='item.imgUrl' alt='' />
								<figcaption>
									<h4>{{item.name}}</h4>
									<p>{{item.des}}</p>
								</figcaption>			
							</figure>
						</div>
						
						<div class='clearfix'> </div>
					</div>
				</div>
				<div class='col-md-6 agileinfo-welcome-right'>
					<h4>这是今日的热门宠物</h4>
					<p> 简介<span>左边的美国短毛猫.
						在1906年被承认。它们起初被命名为“本土短毛猫（Domestic Shorthair）”。它们乘坐五月花号船随着欧洲移民一起来到北美大陆，用以捕捉船舱中的老鼠，是一种纯天然进化过来的功能型猫咪。在人类长期的育种优选下，培育出了稳定的品种。
					</br>
				</br>
						右边的是孟买猫.
						孟买猫同时拥有美国短毛猫的随和天性，以及缅因猫的好奇和友爱性格。它们很喜欢人们的陪伴，对陌生人也会比较友好。缅因猫很粘人，喜欢玩耍，它们喜欢整个家庭，也能和小孩子很好相处。它们如果独处较长时间会变得沮丧。
					</span></p>				</div>
				<div class='clearfix'> </div>
			</div>
		</div>
	</div>
	<!-- banner-bottom -->

	<!-- news -->
	<div class='news'>
		<div class='container'>
			<div class='w3ls-heading'>
				<h3>促销宠物</h3>
			</div>
			<div class='w3-agileits-news-grids'>
				<div class='col-md-6 news-left'>
					<div class='w3-agile-news-date'>
						<div class='agile-news-icon'>
							<i class='fa fa-calendar' aria-hidden='true'></i>
							<p>Nov 24</p>
						</div>
						<div class='agileits-line'> </div>
						<div class='agile-news-icon'>
							<a href='#'><i class='fa fa-comments-o' aria-hidden='true'></i></a>
							<p>2 comments</p>
						</div>
						<div class='agileits-line'> </div>
						<div class='agile-news-icon'>
							<a href='#'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i></a>
							<p>3482</p>
						</div>
					</div>
					<div class='w3-agile-news-img'>
						<a href='single.html'><img v-bind:src='hot.imgUrl' alt='' /></a>
						<h4><a href='single.html'>{{hot.name}}</a></h4>
						<p>{{hot.des}}</p>
					</div>
					<div class='clearfix'> </div>
				</div>
				<div class='col-md-6 news-right'>
					<div class='news-right-grid'>
						<a href='single.html'>简介</a>
						<h5>布偶猫</h5>
						<p>布偶猫放松、开心、就像小孩子的玩偶一样。它们友爱、安静、看起来比较懒散。它们不是很活跃、也不太爱叫。布偶猫以它们的忍受力著称，它们能忍受穿上衣服，并且被抱着走动，不会反抗。因为它们的友好和聪慧，它们经常被拿到与狗进行类比。</p>
					</div>
				
				</div>
				<div class='clearfix'> </div>
			</div>
		</div>
	</div>
	<!-- //news -->
	<!-- footer -->
	<footer>
		<div class='container'>
			<div class='agileits-w3layouts-footer-grids'>
				<div class='col-md-4 footer-left'>
					<h3>
						<a href='index.html'>Cat <span>Club</span></a>
					</h3>
					<div class='footer-social-grids'>
						<ul>
							<li><a href='#'><i class='fa fa-facebook'></i></a></li>
							<li><a href='#'><i class='fa fa-twitter'></i></a></li>
							<li><a href='#'><i class='fa fa-rss'></i></a></li>
						</ul>
					</div>
				</div>
				<div class='col-md-4 footer-left'>
					<h4>Navigation</h4>
					<div class='col-md-6 footer-grid-left'>
						<ul>
							<li><a class='active' href='index.html'>主页</a></li>
							<li><a href='about.html'>About</a></li>								
							<li><a href='gallery.html'>Gallery</a></li>
							<li><a href='icons.html'>Icons</a></li>
						</ul>
					</div>
					<div class='col-md-6 footer-grid-left'>
						<ul>
							<li><a href='typography.html'>Typography</a></li>
							<li><a href='blog.html'>Blog</a></li>
							<li><a href='contact.html'>Contact</a></li>
						</ul>
					</div>
					<div class='clearfix'> </div>
				</div>
				<div class='col-md-4 footer-left'>
					<h4>Newsletter</h4>
					<p>Subscribe With Us</p>
					<form action='#' method='post'>
						<input type='email' placeholder='Subscribe' name='Subscribe' required=''>
						<button class='btn1'>Go</button>
					</form>
				</div>
				<div class='clearfix'> </div>
			</div>
		</div>
	</footer>
	<!-- footer -->
	<!-- copyright -->
	<div class='copyright'>
		<div class='container'>
			<p>Copyright &copy; 2017.Company name All rights reserved.More Templates <a href='http://www.cssmoban.com/' target='_blank' title='模板之家'>模板之家</a> - Collect from <a href='http://www.cssmoban.com/' title='网页模板' target='_blank'>网页模板</a></p>
		</div>
	</div>
</div>
    `
  



})


const renderer = require('vue-server-renderer').createRenderer({
    template: require('fs').readFileSync('./index.html', 'utf-8')
  })
  

exports.renderer = renderer;

exports.app = app;