// 일정데이터 ajax로 땡겨오기
var ajaxData = function(){
	var today = new Date(),				// 서버시간정보 여기에 넣어주세요~!
		wHeight = $(window).height() - 100,
		prevYear = today.getFullYear(), curYear;

	var ajaxfun=$.ajax({
		type:"GET",
		url:"/getCalender",
		dataType:"json",
		data:{
			year:today.getFullYear()
		},
		success:function(res){
			sDataParsing.init(res.schedule);				// 날짜 데이터 파싱
			var data = sDataParsing.callOriginData();		// 날짜 데이터 Fullcalendar object로 파싱
			// 달력 플러그인 실행
			$("#calendar").fullCalendar({
				header:{
					left:"",
					center: "title",
					right:"prev, next today,"
				},
				height:wHeight,			// 오늘 날짜 서버시간 집어넣기
				now:today,         
				titleFormat:"YYYY.MM",
				navLinks:false,				// 달력 요소 클릭가능하게
				dayClick:function(date, e, view){		// 달력 일자 클릭시
					var d = date.format();
					scheduleRegist.resetData();
					$("#start-date").val(d);
					scheduleRegist.show();
				},
				displayEventEnd: {
                    month: false,
                    basicWeek: true,
                    "default": true
                },
				eventClick:function(calEvent, e, view){
					var title = calEvent.title;
					for(var i in data) {
						if(title == data[i].title){
							var val = data[i];
							scheduleRegist.inputVal(data[i]);
						}
					}
					
				},
				viewRender:function(view, element){
					if(!prevYear){return;}

					curYear = view.intervalStart.format().substring(0,4);
					if(prevYear != curYear){
						ajaxData();
					}

					prevYear = curYear;
				},
				eventLimit:false,		// more 출력
				eventLimitClick:"popover",
				events:data
			});
		},
		fail:function(xhr, status, error){
			console.log(error);
		}
	});
};

// 날짜 데이터 파싱
var sDataParsing = (function($){
	var originData;
	var newData = new Object;

	var init = function(data){
		if(!data) return;

		originData = data;
	};

	// 월 데이터(JSON Object) 파싱
	var _makeNewJson = function(data){
		var data = data,
			length = data.length;
			
		for(var i in data){
			var month = Number(data[i].start.substring(5,7));
			newData[month] = new Array();
		}
		
		for(var j in data){
			var n = Number(data[j].start.substring(5,7));
			newData[n].push(data[j]);
		}

		return newData;
	};

	// fullcalendar 에서 필요한 데이터 형태로 변환
	var callOriginData = function(){
		var data = originData,
			length = data.length,
			newData = new Array();

		for(var i=0; i<length; i++){
			newData[i] = new Object;
			newData[i].id = data[i].seq;
			newData[i].title = data[i].title;
			newData[i].write = data[i].writeDate;
			newData[i].start = data[i].startDate;
			newData[i].end = data[i].endDate;
			newData[i].color = data[i].bgcolor;
		}	

		return newData;
	}

	// 월 데이터(JSON Object) 가져오기
	var callMonthData = function(m){
		return newData[m];
	}

	return {
		init:init,
		callOriginData:callOriginData,
		callMonthData:callMonthData
	}
})(jQuery);

// 일정등록 레이어 관리
var scheduleRegist = (function($){
	var $calendar, $schedule;

	var init = function(){
		$calendar = $("#calendar"),
		$schedule = $(".schedule_wrap");

		initEvent();
		colorSpectrum("#f00");
	};

	// 일정등록 레이어 보이기
	var showRegistArea = function(writeDate){
		$schedule.find(".write_date").text("");	
		$schedule.find(".write_date").text(writeDate);
		TweenMax.set($schedule, {display:"block"});
		TweenMax.to($calendar, 0.6, {width:"60%", ease:"Cubic.easeOut"});
		TweenMax.to($schedule, 0.6, {autoAlpha:1, right:0, ease:"Cubic.easeOut"});
	};

	// 일정등록 레이어 숨기기
	var hideRegistArea = function(){
		TweenMax.to($calendar, 0.6, {width:"100%", ease:"Cubic.easeOut"});
		TweenMax.to($schedule, 0.6, {autoAlpha:0, right:"-40%", ease:"Cubic.easeOut", onComplete:function(){
			TweenMax.set($schedule, {display:"none"});
		}});
	};

	// 이벤트 초기화
	var initEvent = function(){
		$schedule.find(".btn.cancel").click(function(e){
			hideRegistArea();
		});
	};

	// 달력 색상 컬러피커 실행
	var colorSpectrum = function(color){
		$schedule.find("#sBg").spectrum({
			color:color,
			showInput: true,
			allowEmpty: false,
			showPalette: true,
			palette: [
				["#000","#444","#666","#999","#ccc","#eee","#f3f3f3","#fff"],
				["#f00","#f90","#ff0","#0f0","#0ff","#00f","#90f","#f0f"],
				["#f4cccc","#fce5cd","#fff2cc","#d9ead3","#d0e0e3","#cfe2f3","#d9d2e9","#ead1dc"],
				["#ea9999","#f9cb9c","#ffe599","#b6d7a8","#a2c4c9","#9fc5e8","#b4a7d6","#d5a6bd"],
				["#e06666","#f6b26b","#ffd966","#93c47d","#76a5af","#6fa8dc","#8e7cc3","#c27ba0"],
				["#c00","#e69138","#f1c232","#6aa84f","#45818e","#3d85c6","#674ea7","#a64d79"],
				["#900","#b45f06","#bf9000","#38761d","#134f5c","#0b5394","#351c75","#741b47"],
				["#600","#783f04","#7f6000","#274e13","#0c343d","#073763","#20124d","#4c1130"]
			],
			change:function(){
				$(this).spectrum("hide");
			},
			hide:function(color){
				$(this).val(color.toHexString());
			}
		});
	}

	// 일정 등록 레이어 초기화
	var resetData = function(){
		colorSpectrum("#fff");
//		$schedule.find("input[type=text]").val("");
//		$schedule.find("#stTime").val("");
//		$schedule.find("#edTime").val("");
//		$schedule.find("#sbg").val("#fff");
//		$("[name='lecture_code']").val("");
		
		$("[name='schedule_title']").val("주간화상회의");
		$("[name='stTime']").val("18:00");
		$("[name='edTime']").val("18:00");
	};

	var inputVal = function(val){
		var data = val;
		
		var tmptitle = data.title.split(":");

		$schedule.find("#sTitle").val(tmptitle[1]);
		$schedule.find("#start-date").val(data.start.substring(0, 10));
		$schedule.find("#end-date").val(data.end.substring(0, 10));
		
		$schedule.find("#seq").val(data.id);
		$schedule.find("#stTime").val(data.start.substring(11, 19));
		$schedule.find("#edTime").val(data.end.substring(11, 19));
		
		
		colorSpectrum(data.color);

		showRegistArea(data.write);
	}	

	return {
		init:init,
		show:showRegistArea,
		hide:hideRegistArea,
		resetData:resetData,
		inputVal:inputVal
	}
})(jQuery);