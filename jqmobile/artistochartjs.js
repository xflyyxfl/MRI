function c_data2(n){



	bigdata = [n*Math.random()];
	for(var i = 1; i < 1024; i++) {
		var val = bigdata[i - 1] + (Math.random() * ((Math.random() > 0.5) ? -1 : 1));
		val = (val > 50) ? 50 : val;
		val = (val < 0) ? 0 : val;
		bigdata.push(val);
	}
//n=n+1;

}

var d=new Object()
var bigdata1
var bigdata2
function c_data3(n){



	bigdata = [n];

	bigdata1 = [n];
	bigdata2=[n*Math.sqrt(2)];
	for(var i = 1; i < 1024; i++) {
		var val = bigdata[i - 1] + (Math.random() * ((Math.random() > 0.5) ? -2 : 2));
		val = (val > 50) ? 50 : val;
		val = (val < 0) ? 0 : val;
		bigdata.push(val);
		bigdata1.push(50-val);
		bigdata2.push(Math.sqrt(Math.pow(val,2)+Math.pow(50-val,2)));
		

	}
//n=n+1;

}
function set_data()
{

	window.graph.data.y=bigdata;
	window.graph.render();
	

}

function set_d(d)
{

	window.graph.data=d;
	window.graph.render();
	

}

var cx=new Object()
cx={
	max:0,
	min:10,
	range:10
	}

function xfl(){c_data3(10);set_d({x:10,y:bigdata,y1:bigdata1,y2:bigdata2});}	

setTimeout(function(){alert(i);}, 1000);
setTimeout(function(){c_data(10);set_data();}, 1000);

function run_time_num(fun,t,n)
{
	//var timer=setTimeout(fun(),t);
	//var a=eval(fun);
	var i=1;
	var timer=setInterval(function(){fun();i++;if(i>n)clearInterval(timer);},t);
	
		
}