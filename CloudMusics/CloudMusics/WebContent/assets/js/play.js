/**************************************************
 * 播放器主功能模块
 * 修改：2018-1-18
 *************************************************/

var dsjdt;//进度条显示定时器
var dstime;//播放时间显示定时器
var players = document.getElementById("player");//播放器
var fengmian = document.getElementById("fengmian");//音乐封面
var musicTime = players.duration;//获取音乐总时间
var musicp = document.getElementById("musicp");//音乐进度条

function cleradsq(){//清除定时器
	console.info("清除定时器");
	window.clearInterval(dsjdt);//取消进度条定时器
	window.clearInterval(dstime);//取消显示时间定时器
}

function dsq(){//添加定时器
	var mtime = document.getElementById("mtime");//播放时间
	
	dsjdt = setInterval(function(){//添加进度条定时器
		var cur = players.currentTime;//获取当前的播放时间
//		musicp.style.width = parseFloat(cur/musicTime)*100+"%";//改变进度条
		musicp.value = parseFloat(cur/musicTime)*100;
	},50);
	
	dstime = setInterval(function(){//添加播放时间显示定时器
		if(players.ended){//判断是否播放完毕
			fengmian.className = "img-circle";//封面停止旋转
			cleradsq();
		}
		
		var cur=players.currentTime;//获取当前的播放时间
		var tmp;
		//总时间
		var totletime = Math.floor(musicTime/60);//分钟下取整
		tmp = Math.ceil(musicTime%60);//秒数上取整
		if(tmp>=10){
			totletime += ":" + tmp;
		}else{
			totletime += ":0" + tmp;
		}
		
		//已播放时间
		var currenttime = Math.floor(cur/60);//分钟下取整
		tmp = Math.ceil(cur%60);//秒数上取整
		if(tmp>=10){
			currenttime += ":" + tmp;
		}else{
			currenttime += ":0" + tmp;
		}
		
		mtime.innerHTML = currenttime+"/"+totletime;//改变显示时间
	},1000);
}

//切换歌曲时改变总音乐总时间
players.ondurationchange=function(){
	musicTime=players.duration;
}

function prev(){//上一曲
	players.src = "红装 .mp3";
	plays();
}

function plays(){//播放
	fengmian.className = "img-circle dh";//封面旋转
	players.play();//开始播放
	dsq();
}

function pause(){//暂停
	players.pause();//暂停播放
	fengmian.className = "img-circle";//封面停止旋转
	cleradsq();
}

function stop(){//停止
	players.load();//重新加载音乐
	fengmian.className = "img-circle";//封面停止旋转
	musicp.value = 0;
	cleradsq();
}

function next(){//下一曲
	players.src = "红装 .mp3";
	plays();
}

//function mp(e,t){//改变进度条
//	//获取点击百分比
//	var scale = e.offsetX/t.offsetWidth;
//	console.info("播放进度："+parseInt(scale*players.duration)/parseInt(players.duration)*100+"%");
//	players.currentTime = parseInt(scale*players.duration);//改变播放进度
//}

//进度条鼠标按下关闭定时器(不然无法更改播放进度)
musicp.onmousedown = function(){
	cleradsq();
}
function mp(t){//改变进度条
	console.info("播放进度："+parseInt(t.value*players.duration)/parseInt(players.duration)*100+"%");
	players.currentTime = parseInt(t.value/100*players.duration);//改变播放进度
	plays();//播放并打开定时器
}
//进度条鼠标松开打开定时器
musicp.mouseup = function(){
//	dsq();
}

//静音开关
function sound(t){
	if(players.muted){
		document.getElementById("soundp").style.width = players.volume*100 + "%";
		players.muted = false;
		//改变图标
		t.childNodes[2].className="glyphicon glyphicon-volume-up";
	}else{
		document.getElementById("soundp").style.width = 0 + "%";
		players.muted = true;
		//改变图标
		t.childNodes[2].className="glyphicon glyphicon-volume-off";
	}
}

//音量控制
function sp(e,t){
	//改变图标
	t.parentNode.previousSibling.previousSibling.previousSibling.childNodes[2].className="glyphicon glyphicon-volume-up";
	//获取点击位置（音量大小）
	var scale = e.offsetX/t.offsetWidth;
	console.info("音量："+e.offsetX+":"+t.offsetWidth);
	players.volume = scale;//改变播放进度
	document.getElementById("soundp").style.width = scale*100 + "%";
}