<!DOCTYPE HTML>
<html>

<head>
    <title>Sample Application</title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    <%--<script type="text/javascript" src="../js/fileUpload.js"></script>--%>
</head>
<body>
<h1>Hello, ${name}!</h1>

<h2>Youuuu, ${test}</h2>

<%--<form action="/ExcelPoiSample/uploadExcel" enctype="multipart/form-data" method="post">
    <input type="file" name="uploadFile"/>
    <input type="submit" name="upldBtn"/>
</form>--%>

<form name="yourform">
    <button id="upldBtn" title="Upload">Do the upload</button>

    <div id="textarea" style="display: none;"></div>

    <input type="file" class="file" id="file" name="file" title="Please upload"/>
</form>
</body>
</html>

<script type="text/javascript">
    $(function () {

        $('#upldBtn').click(function () {
            var contextPath = 'ExcelPoiSample';
            var servletName = 'excel';
            var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none" />');
            $("body").append(iframe);

            $("form#yourform").attr('action', contextPath + servletName);
            $("form#yourform").attr('enctype', "multipart/form-data");
            $("form#yourform").attr("target", "postiframe");
            $("form#yourform").attr("file", $('#file').val());

            $('yourform').submit(); //upload button
            $("#postiframe").load(function () {
                iframeContents = $("#postiframe")[0].contentWindow.document.body.innerHTML;
                $("#textarea").html(iframeContents);
                $.ajax({
                    type: "GET",
                    url: contextPath + servletName,
                    data: "action=download",
                    async: false,
                    dataType: "text",
                    success: function (result) {
//do something
                    }
                });
            })
        });
    });
</script>
