
//封装一个通用的异步请求
//maethod 提交方式
//url 提交路径
//data 数据
//callBack 处理响应数据的函数
function ajax(maethod,url,data,callBack) {
	var xhr;
	if(window.XMLHttpRequest){
		//绝大多数浏览器获取XMLHttpRequest方法
		xhr = new XMLHttpRequest();
	}else{
		//IE5 IE6的获取方法
		xhr = new ActiveXObject("microsoft.XMLHTTP");
	}
	xhr.open(maethod,url,true);
	
	if(maethod.toLowerCase == "post"){
		//设置请求头
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	}
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var msg = xhr.responseText;
			//闭包
			callBack(msg);
		}
	}
	xhr.send(data);
}






