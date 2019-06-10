function take_snapshot() {
    var data2;
    // take snapshot and get image data
    Webcam.snap( function(data_uri) {
        // display results in page
        document.getElementById('results2').innerHTML =
            '<h2>Here is your image:</h2>' +
            '<img src="'+data_uri+'"/>';
        data2= data_uri;
        var params = {
            // Request parameters
            "returnFaceId": "true",
            "returnFaceLandmarks": "false",
            "returnFaceAttributes":"age,gender,headPose,smile,facialHair,glasses,emotion," +
                "hair,makeup,occlusion,accessories,blur,exposure,noise"
        };

        var baseimg=data2;
        var sourceImageUrl=baseimg;
//					            document.querySelector("#sourceImage").src = sourceImageUrl;

        function mkblob(dataURL) {
            var BASE64_MARKER = ';base64,';
            if (dataURL.indexOf(BASE64_MARKER) == -1) {
                var parts = dataURL.split(',');
                var contentType = parts[0].split(':')[1];
                var raw = decodeURIComponent(parts[1]);
                return new Blob([raw], { type: contentType });
            }
            var parts = dataURL.split(BASE64_MARKER);
            var contentType = parts[0].split(':')[1];
            var raw = window.atob(parts[1]);
            var rawLength = raw.length;

            var uInt8Array = new Uint8Array(rawLength);

            for (var i = 0; i < rawLength; ++i) {
                uInt8Array[i] = raw.charCodeAt(i);
            }

//					             return new Blob(uInt8Array, { type: contentType });
            return uInt8Array;
        }

//					        	alert(mkblob(baseimg));
//					        	console.log($.param(params));

        $.ajax({
            url: "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?" + $.param(params),
            beforeSend: function(xhrObj){
                // Request headers
                xhrObj.setRequestHeader("Content-Type","application/octet-stream");
                xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","b74721472f9443ceb2f7902b00ce7724");
            },
            type:"POST",
            // Request body
            data:mkblob(baseimg),
            processData: false,
            success : function(resp){
                fac2 = resp[0].faceId;
            }
        })
            .done(function(data) {
                alert("success");
            })
            .fail(function() {
                alert("error");
            });
    });
}



function result(){
    $.ajax({
        url: "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/verify",
        beforeSend: function(xhrObj){
            // Request headers
            xhrObj.setRequestHeader("Content-Type","application/json");
            xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","b74721472f9443ceb2f7902b00ce7724");
        },
        type: "POST",
        // Request body
        data:'{"faceId1":'+'"'+ fac1+'","faceId2" :' + '"'+fac2+'"}',
        success : function(resp){
            result=resp.isIdentical;
            if(result==true){
                alert("같은사람입니다.");
            }else{
                alert("다른사람입니다.");
            }

        }

    })
        .done(function(data) {
            alert("success");
        })
        .fail(function() {
            alert("error");
        });

}