/*最小高度*/
function minHeight(){
	var h = $(window).height();
	var body = parseInt(h) -250;
	var min = 260;
	if(body > min){
		$('.register-body').css('min-height',body + 'px');
	}else{
		$('.register-body').css('min-height',min + 'px');
	}
}
minHeight();	
$(window).resize(function() {
  minHeight();
});
// 登录注册切换
$('.sign,.reg').click(function(){
	$(this).addClass('activ').siblings().removeClass('activ')
	if($(this)[0].className[0] === 's'){
		$('.signItem').addClass('show')
    $('.regItem').removeClass('show')
	}else{
    $('.signItem').removeClass('show')
    $('.regItem').addClass('show')
	}
})

