/**
* Theme: Notika Template
* Author: Kalam
* Chat application 
*/

!function($) {
    "use strict";

    var ChatApp = function() {
        this.$body = $("body"),
        this.$chatInput = $('.chat-input'),
        this.$chatList = $('.conversation-list'),
        this.$chatSendBtn = $('.chat-send .btn'),
        this.$userName = $('#userName'),
        this.$contextPath=$('#contextPath'),
        this.$scrollbar=$('.widgets-chat-scrollbar')
//        this.$conversation=$('.chat-conversation')
//        this.$cardbox=$('.card-box')
    };

    //saves chat entry - You should send ajax call to server in order to save chat enrty
    ChatApp.prototype.save = function() {
        var chatText = this.$chatInput.val();
        var chatTime = moment().format("MM/DD hh:mm");
        var uaerName = this.$userName.val();
        var contextPath = this.$contextPath.val();
        if (chatText == "") {
            sweetAlert("Oops...", "You forgot to enter your chat message", "error");
            this.$chatInput.focus();
        } else {
        	 $('<li class="clearfix"><div class="chat-avatar"><i>' + chatTime + '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>'+uaerName+'</i><p>' + chatText + '</p></div></div></li>').appendTo('ul.conversation-list');
        	 $('.widgets-chat-scrollbar').mCustomScrollbar("scrollTo","last");
        	 var query =chatText;
			  $("#resultArea").append($("<tr><td>").text(query));
	  	$.ajax({
		  type: "POST",
         url: "https://api.dialogflow.com/v1/query?v=20150910",
         contentType: "application/json; charset=utf-8",
         headers: {
             Authorization:"Bearer "+"5bff01311f1b452696d6c9aabc431967"
         },
         data: JSON.stringify({
       	  contexts: [
       	               "shop"
       	             ],
             query: query ,
             lang: "ko",
             sessionId: "12345",
             timezone: "America/New_York"
             
         }),
         success: function(response) {
             console.log("success");
             // Here you will get the response to your query in json, you will have to parse it based on the type it has like text, image, card etc. & show it to user. 
            
//              alert(response.result.fulfillment.messages[0].speech);
             $('<li class="clearfix odd"><div class="chat-avatar"><i>' + chatTime + '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>대덕인재대학교</i><p>' + response.result.fulfillment.messages[0].speech + '</p></div></div></li>').appendTo('ul.conversation-list');
             $('.widgets-chat-scrollbar').mCustomScrollbar("scrollTo","last");
             var target = (response.result.parameters.target);
             var targetParam = {"target": target};
             
             if(target){
            	 $.ajax({
           			url : contextPath+"/chatBotSchedule",//요청주소
           			method : "post",
           			data: targetParam,
           			dataType : "json", // request header(Accept), response header(Content-Type)
           			success : function(resp) {
           				var respList = resp;
           				$(respList).each(function(idx, resps){
           					$('<li class="clearfix odd"><div class="chat-avatar"><i>' + chatTime + '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>대덕인재대학교</i><p>' + resps.scheduleName +resps.startSchedule+"~" + resps.endSchedule+ '</p></div></div></li>').appendTo('ul.conversation-list');
           					$('.widgets-chat-scrollbar').mCustomScrollbar("scrollTo","last");
           				})

           			},
           			error : function(errorResp) {
           				console.log(errorResp.status);
           			}

           		});
            	 
            	
             }
           
             
         },
         error: function() {
             console.log("Error");
         }

		});
	  	 this.$chatInput.val('');
         this.$chatInput.focus();
             
        }
    },
    ChatApp.prototype.init = function () {
        var $this = this;
        //binding keypress event on chat input box - on enter we are adding the chat into chat list - 
        $this.$chatInput.keypress(function (ev) {
            var p = ev.which;
            if (p == 13) {
                $this.save();
                return false;
            }
        });


        //binding send button click
        $this.$chatSendBtn.click(function (ev) {
           $this.save();
           return false;
        });
    },
    //init ChatApp
    $.ChatApp = new ChatApp, $.ChatApp.Constructor = ChatApp
    
}(window.jQuery),

//initializing main application module
function($) {
    "use strict";
    $.ChatApp.init();
}(window.jQuery);