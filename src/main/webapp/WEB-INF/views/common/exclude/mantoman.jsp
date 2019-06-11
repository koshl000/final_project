<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <%--    <link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico"/>--%>
    <%--    <link rel="mask-icon" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111"/>--%>
    <%--    <link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+"/>--%>
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet'
          type='text/css'>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
    <link rel='stylesheet prefetch'
          href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mychat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/example-styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/dev/getHTMLMediaElement.css">

    <script src="https://use.typekit.net/hoy3lrg.js"></script>
    <%--    <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>--%>
    <script src="${pageContext.request.contextPath}/res/js/jquery-3.3.1.min.js"></script>
    <%--    <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>--%>
    <%--    <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>--%>
    <%--    <script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>--%>
    <script src="${pageContext.request.contextPath}/res/dist/RTCMultiConnection.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/socket/socket.io.js"></script>
    <script src="${pageContext.request.contextPath}/res/dev/getHTMLMediaElement.js"></script>
</head>
<body>
<div id="frame" class="vid_con">
</div>
<div id="frame">
    <div id="half_frame">
        <iframe src="${pageContext.request.contextPath}/professor/showExam" style="width: 100%;height: 100%;"></iframe>
    </div>
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
                    <%--                            <span class="contact-status online"></span>--%>
                    <%--                            <img src="${pageContext.request.contextPath }/res/images/male.png" alt=""/>--%>
                    <%--                            <div class="meta">--%>
                    <%--                                <p class="name">${user.user_name}(${user.user_id})</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>
                    <%--                    <li class="contact active">--%>
                    <%--                        <div class="wrap">--%>
                    <%--                            <span class="contact-status busy"></span>--%>
                    <%--                            <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt=""/>--%>
                    <%--                            <div class="meta">--%>
                    <%--                                <p class="name">Harvey Specter</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>
                    <%--                    <li class="contact">--%>
                    <%--                        <div class="wrap">--%>
                    <%--                            <span class="contact-status"></span>--%>
                    <%--                            <img src="http://emilcarlsson.se/assets/danielhardman.png" alt=""/>--%>
                    <%--                            <div class="meta">--%>
                    <%--                                <p class="name">Daniel Hardman</p>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </li>--%>
                </ul>
            </div>
        </div>
        <div class="content">
            <div class="messages">
                <ul>
                    <%--                    <li class="sent">--%>
                    <%--                        <img src="http://emilcarlsson.se/assets/mikeross.png" alt=""/>--%>
                    <%--                        <p>How the hell am I supposed to get a jury to believe you when I am not even sure that--%>
                    <%--                            I--%>
                    <%--                            do?!</p>--%>
                    <%--                    </li>--%>
                    <%--                    <li class="replies">--%>
                    <%--                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt=""/>--%>
                    <%--                        <p>When you're backed against the wall, break the god damn thing down.</p>--%>
                    <%--                    </li>--%>
                </ul>
            </div>
            <div class="message-input">
                <div class="wrap">
                    <input type="text" placeholder="Write your message..."/>
                    <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
                    <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--화상채팅js--%>
<script>
    var connection = new RTCMultiConnection();
    // connection.socketURL = 'https://localhost:9002/';
    connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
    connection.socketMessageEvent = 'video-conference-demo';
    connection.session = {
        audio: true,
        video: true
    };
    connection.sdpConstraints.mandatory = {
        OfferToReceiveAudio: true,
        OfferToReceiveVideo: true
    };
    let connectedCount = 0;
    let roomid = 100;
    connection.openOrJoin(roomid, function (isRoomExist, roomid, error) {
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
        let video = document.createElement("video");
        if (event.type === 'local') {
            video.setAttribute("width", "100%");
            video.setAttribute("height", "100%");
            video.volume = 0;
            try {
                video.setAttributeNode(document.createAttribute('muted'));
            } catch (e) {
                video.setAttribute('muted', true);
            }
        } else if (event.type === 'remote') {
            if (video_cnt >= 4) {
                alert("허용인원 초과");
                return;
            }
            if (video_cnt === 1) {
                videos[0].setAttribute("height", "50%");
                video.setAttribute("width", "100%");
                video.setAttribute("height", "50%");
            } else if (video_cnt === 2) {
                videos[1].setAttribute("width", "50%");
                video.setAttribute("width", "50%");
                video.setAttribute("height", "50%");
            } else if (video_cnt === 3) {
                videos[0].setAttribute("width", "50%");
                video.setAttribute("width", "50%");
                video.setAttribute("height", "50%");
            }
            video_cnt++;
        }
        vid_con.appendChild(video);
        videos.push(video);
        try {
            video.setAttributeNode(document.createAttribute('autoplay'));
            video.setAttributeNode(document.createAttribute('playsinline'));
        } catch (e) {
            video.setAttribute('autoplay', true);
            video.setAttribute('playsinline', true);
        }
        video.srcObject = event.stream;
        setTimeout(function () {
            // video.media.play();
        }, 5000);
        mediaElement.id = event.streamid;
        // to keep room-id in cache
        localStorage.setItem(connection.socketMessageEvent, connection.sessionid);
        if (event.type === 'local') {
            connection.socket.on('disconnect', function () {
                if (!connection.getAllParticipants().length) {
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
    connection.onleave = function (event) {
        vid_con.removeChild(videos.pop());
        if (videos.length === 3) {
            videos[0].setAttribute("width", "100%");
        } else if (videos.length === 2) {
            videos[1].setAttribute("width", "100%");
        } else if (videos.length === 1) {
            videos[0].setAttribute("height", "100%");
        } else {
            alert("videos is out of index");
            return;
        }
    };
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
    var socket = io('https://localhost:9003');

    var userInfo = {
        user_id: '${user.user_id}',
        user_name: '${user.user_name}'
    };

    function user_info(id, name) {
        var out =
            "<li class=\"contact\">\n" +
            "   <div class=\"wrap\">\n" +
            "       <span class=\"contact-status online\"></span>\n" +
            "       <img src=\"${pageContext.request.contextPath}/res/images/male.png\" alt=\"\"/>\n" +
            "       <div class=\"meta\">\n" +
            "       <p class=\"name\">" + name + "(" + id + ")</p>\n" +
            "       </div>\n" +
            "   </div>\n" +
            "</li>";
        return out;
    }

    function message(msg) {
        var out =
            "<li class=\"replies\">\n" +
            "   <img src=\"${pageContext.request.contextPath}/res/images/male.png\" alt=\"\"/>\n" +
            "   <p>" + msg + "</p>\n";
        return out;
    }

    socket.on('connect', function () {
        console.log('connected....');
    });

    socket.emit('userInfo', userInfo);
    socket.on('userInfo', function (users) {
        $('#contacts ul').empty();
        for (var i = 0; i<users.user_id.length; ++i) {
            $('#contacts ul').append(user_info(users.user_id[i], users.user_name[i]));
        }
    });

    $(window).on('unload',function(){
        console.log('unload');
        socket.emit('exit', userInfo);
    });

    socket.on('chat message', function (msg) {
        $('.messages ul').append(newMessage(msg));
    });

    socket.on('disconnect', function (userInfo) {
    });


    function newMessage(message) {
        if ($.trim(message) == '') {
            return false;
        }
        $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
        $('.message-input input').val(null);
        $(".messages").animate({scrollTop: $(document).height()}, "fast");
    }

    $(".messages").animate({scrollTop: $(document).height()}, "fast");

    $("#profile-img").click(function () {
        $("#status-options").toggleClass("active");
    });

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

    $('.submit').click(function () {
        socket.emit('chat message', message);
        newMessage(message);

    });

    $(window).on('keydown', function (e) {
        if (e.which === 13) {
            message = $(".message-input input").val();
            newMessage(message);
            socket.emit('chat message', message);
            return false;
        }
    });

    $(document).on("dblclick",".contact",function(){

    });


</script>

</body>
</html>