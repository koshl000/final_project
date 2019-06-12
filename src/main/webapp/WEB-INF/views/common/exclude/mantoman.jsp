<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet'
          type='text/css'>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
    <link rel='stylesheet prefetch'
          href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mychat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/example-styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/dev/getHTMLMediaElement.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/Login_v3/vendor/bootstrap/css/bootstrap.css">

    <script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
            integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/res/Login_v3/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="https://use.typekit.net/hoy3lrg.js"></script>
    <script src="${pageContext.request.contextPath}/res/dist/RTCMultiConnection.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/socket/socket.io.js"></script>
    <script src="${pageContext.request.contextPath}/res/dev/getHTMLMediaElement.js"></script>
</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<div id="frame" class="vid_con">
</div>
<div id="frame">
    <div id="half_frame">
        <div id="sidepanel">
            <div id="profile">
                <div class="wrap">
                    <%--현재유저--%>
                    <img id="profile-img" src="${pageContext.request.contextPath}/res/images/male.png" class="online"
                         alt=""/>
                    <p>${user.user_id}(${user.user_name})</p>

                    <div id="status-options">
                        <ul>
                            <li id="status-online" class="active"><span class="status-circle"></span>
                                <p>접속중</p></li>
                            <li id="status-busy"><span class="status-circle"></span>
                                <p>화상채팅중</p></li>
                            <li id="status-offline"><span class="status-circle"></span>
                                <p>오프라인</p></li>
                        </ul>
                    </div>
                </div>
            </div>
            <%--수강중인 유저--%>
            <div id="contacts">
                <ul>
                    <%--                    <li class="contact">--%>
                    <%--                        <div class="wrap">--%>
                    <%--                            <span class="contact-status online"></span><busy,online,' '>--%>
                    <%--                            <img src="${pageContext.request.contextPath }/res/images/male.png" alt=""/>--%>
                    <%--                            <div class="meta">--%>
                    <%--                                <p class="name">${user.user_name}(${user.user_id})</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>
                </ul>
            </div>
        </div>
        <div class="content">
            <div class="messages">
                <ul>
                </ul>
            </div>
            <div class="message-input">
                <div class="wrap">
                    <input type="text" placeholder="Write your message..." style="width: 91%"/>
                    <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    String.prototype.hashCode = function () {
        var hash = 0, i, chr;
        if (this.length === 0) return hash;
        for (i = 0; i < this.length; i++) {
            chr = this.charCodeAt(i);
            hash = ((hash << 5) - hash) + chr;
            hash |= 0; // Convert to 32bit integer
        }
        return hash;
    };
</script>
<%--화상채팅js--%>
<script>
    var connection = new RTCMultiConnection();
    connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
    connection.socketMessageEvent = 'videoEvent001';

    connection.session = {
        audio: true,
        video: true
    };
    connection.sdpConstraints.mandatory = {
        OfferToReceiveAudio: true,
        OfferToReceiveVideo: true
    };
    let connectedCount = 0;
    <%--let roomid = '${roomId}'.toString().hashCode();--%>
    let roomid=100;
    connection.openOrJoin(100, function (isRoomExist, roomid, error) {
        if (error) {
            alert(error);
        }
    });
    let videos = [];
    let video_cnt = 1;
    let vid_con = document.querySelector(".vid_con");
    connection.onstream = function (event) {
        event.mediaElement.removeAttribute('src');
        event.mediaElement.removeAttribute('srcObject');
        event.mediaElement.muted = true;
        event.mediaElement.volume = 0;

        var video = document.createElement('video');

        try {
            video.setAttributeNode(document.createAttribute('autoplay'));
            video.setAttributeNode(document.createAttribute('playsinline'));

        } catch (e) {
            video.setAttribute('autoplay', true);
            video.setAttribute('playsinline', true);
            video.setAttribute('height','100%');
            video.setAttribute('width','100%');
        }

        if(event.type === 'local') {
            video.volume = 0;
            try {
                video.setAttributeNode(document.createAttribute('muted'));
            } catch (e) {
                video.setAttribute('muted', true);
            }
        }
        video.srcObject = event.stream;

        vid_con.appendChild(video);

        setTimeout(function() {
            video.play();
        }, 5000);

        video.id = event.streamid;

        // to keep room-id in cache
        localStorage.setItem(connection.socketMessageEvent, connection.sessionid);

        if(event.type === 'local') {
            connection.socket.on('disconnect', function() {
                if(!connection.getAllParticipants().length) {
                    location.reload();
                }
            });
        }
    };
    connection.onstreamended = function (event) {
        var mediaElement = document.getElementById(event.streamid);
        if (mediaElement) {
            mediaElement.parentNode.removeChild(mediaElement);
        }
    };
    connection.onMediaError = function (e) {
        if (e.message === 'Concurrent mic process limit.') {
            if (DetectRTC.audioInputDevices.length <= 1) {
                alert('Please select external microphone. Check github issue number 483.');
                return;
            }

            var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
            connection.mediaConstraints.audio = {
                deviceId: secondaryMic
            };
            connection.join(connection.sessionid);
        }
    };
    // connection.onleave = function (event) {
    //     vid_con.removeChild(videos.pop());
    //     if (videos.length === 3) {
    //         videos[0].setAttribute("width", "100%");
    //     } else if (videos.length === 2) {
    //         videos[1].setAttribute("width", "100%");
    //     } else if (videos.length === 1) {
    //         videos[0].setAttribute("height", "100%");
    //     }
    // };
    if (roomid && roomid.length) {
        (function reCheckRoomPresence() {
            connection.checkPresence(roomid, function (isRoomExist) {
                if (isRoomExist) {
                    connection.join(roomid);
                    return;
                }
                setTimeout(reCheckRoomPresence, 5000);
            });
        })();
    }
</script>
<%--문자채팅 및 유저 리스트--%>
<script>
    var socket = io('https://localhst:9003');

    var userInfo = {
        user_id: '${user.user_id}',
        user_name: '${user.user_name}'
    };

    //유저 상태 변경
    $("#status-options ul li").click(function () {
        $("#profile-img").removeClass();
        $("#status-online").removeClass("active");
        $("#status-busy").removeClass("active");
        $("#status-offline").removeClass("active");
        $(this).addClass("active");

        if ($("#status-online").hasClass("active")) {
            $("#profile-img").addClass("online");
        } else if ($("#status-busy").hasClass("active")) {
            $("#profile-img").addClass("busy");
        } else if ($("#status-offline").hasClass("active")) {
            $("#profile-img").addClass("offline");
        } else {
            $("#profile-img").removeClass();
        }
        $("#status-options").removeClass("active");
    });

    socket.on('status_change',function(status,info){
        $(".contacts").find(".contact").each(function(index){
            if($(this).find("p").first().text().indexOf(info.user_id)!==-1){
                $(this).find("span").first().addClass();
            }
        })
    });

    function user_info(id, name) {
        var out =
            "<li class=\"contact\">\n" +
            "   <div class=\"wrap\">\n" +
            "       <span class=\"contact-status online\"></span>\n" +
            "       <img src=\"${pageContext.request.contextPath}/res/images/male.png\" alt=\"\"/>\n" +
            "       <div class=\"meta\">\n" +
            "       <p id=\"" + id + "\" class=\"name\">" + name + "(" + id + ")</p>\n" +
            "       </div>\n" +
            "   </div>\n" +
            "</li>";
        return out;
    }

    function message1(msg, info) {
        var out =
            "<li class=\"replies\">\n" +
            "<img src=\"${pageContext.request.contextPath}/res/images/male.png\" alt=\"\"/>\n" +
            "<h6 style=\" float: right;margin: 6px 0 0 8px;display:block;\"><font color=\"white\" style=\"float: right;margin: 6px 0 0 8px;display:block;\">" + info.user_name + "(" + info.user_id + ")</font></h6>\n" +
            "<p>" + msg + "</p>\n";
        $(".messages").animate({scrollTop: $(document).height()}, "fast");

        return out;
    }

    function newMessage(message, info) {
        if ($.trim(message) == '') {
            return false;
        }
        $('<li class="sent"><img src="${pageContext.request.contextPath}/res/images/male.png" alt="" /><h6 style><font color="white">' +
            info.user_name + '(' + info.user_id + ')</font></h6><p>' + message + '</p></li>').appendTo($('.messages ul'));
        $('.message-input input').val(null);
        $(".messages").animate({scrollTop: $(document).height()}, "fast");
    }

    socket.on('connect', function () {
        console.log('connected....');
    });

    socket.emit('userInfo', userInfo);
    socket.on('userInfo', function (users) {
        $('#contacts ul').empty();
        for (var i = 0; i < users.user_id.length; ++i) {
            $('#contacts ul').append(user_info(users.user_id[i], users.user_name[i]));
        }
    });

    $(window).on('unload', function () {
        console.log('unload');
        socket.emit('exit', userInfo);
    });

    socket.on('disconnect', function (userInfo) {
    });

    $(".messages").animate({scrollTop: $(document).height()}, "fast");

    $("#profile-img").click(function () {
        $("#status-options").toggleClass("active");
    });

    socket.on('chat message', function (msg, info) {
        if (info.user_id !== userInfo.user_id) {
            $('.messages ul').append(message1(msg, info));
        }
    });

    // socket.emit('status_change',$("profile-img").attr('class'),userInfo);

    var testPtag =null;

    function test(pTag){
        testPtag = pTag;
        return pTag;
    }

    $('.submit').click(function () {
        message = $(".message-input input").val();
        socket.emit('chat message', message, userInfo);
        newMessage(message, userInfo);
    });

    $(window).on('keydown', function (e) {
        if (e.which === 13) {
            message = $(".message-input input").val();
            newMessage(message, userInfo);
            socket.emit('chat message', message, userInfo);
        }
    });

    $(document).on("dblclick", ".contact", function (e) {
        if($(this).find("span").hasClass("busy")||$(this).find("span").hasClass("offline")){
            alert("오프라인&화상채팅 중인 유저는 초대할수 없습니다.");
        }else{
//             $(".modal").modal({backdrop: 'static', keyboard: false});
			var roomId = '${roomId}';
			var targetId = $(this).find('p').hasClass('name').prop('id');
			var sendData = {
				'targetId' : targetId,
				'roomId' : roomId,
				'lecture_code' : '${lecture_code}'
			};
			console.log(sendData);
			var jsonData = JSON.stringify(sendData);
			$.ajax({
				url : '${pageContext.request.contextPath}/invitation/sending',
				method : 'post',
				data : jsonData,
				contentType : 'application/json;charset=UTF-8',
				dataType : 'text',
				success : function(resp){
					alert(resp);
				},
				error : function(resp){
					alert(resp);
				}
			});
        }
    });
</script>

</body>
</html>