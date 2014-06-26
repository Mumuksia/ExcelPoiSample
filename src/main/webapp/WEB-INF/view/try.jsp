<!doctype html>
<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
    <link href="http://cdn.sencha.com/ext/gpl/4.2.0/resources/css/ext-all.css" rel="stylesheet"/>
    <%--    <script src="http://cdn.sencha.com/ext/gpl/4.2.0/ext-all.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/fileUpload.js"></script>
    <script>
        $(function () {
            $("#tabs").tabs({
                beforeLoad: function (event, ui) {
                    ui.jqXHR.error(function () {
                        ui.panel.html(
                                "Couldn't load this tab. We'll try to fix this as soon as possible. " +
                                        "If this wouldn't be a demo.");
                    });
                }
            });
        });
    </script>
    <style>
        form {
            display: block;
            margin: 20px auto;
            background: #eee;
            border-radius: 10px;
            padding: 15px
        }

        #progress {
            position: relative;
            width: 400px;
            border: 1px solid #ddd;
            padding: 1px;
            border-radius: 3px;
        }

        #bar {
            background-color: #B4F5B4;
            width: 0%;
            height: 20px;
            border-radius: 3px;
        }

        #percent {
            position: absolute;
            display: inline-block;
            top: 3px;
            left: 48%;
        }
    </style>
</head>

<body><%-- onload="doOnLoad();--%>
<h1>Ajax File Upload Demo</h1>

<form id="myForm" action="uploadExcel" method="post" enctype="multipart/form-data">
    <input type="file" name="uploadFile">
    <input type="submit" value="Ajax File Upload">
</form>

<div id="progress" hidden="true">
    <div id="bar"></div>
    <div id="percent">0%</div>
</div>
<br/>

<div id="message"></div>

<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Preloaded</a></li>
        <li><a href="tabExcel">Tab 1</a></li>
        <li><a href="tabExcel">Tab 2</a></li>
        <li><a href="home">Tab 3 (slow)</a></li>
        <li><a href="ajax/content4-broken.php">Tab 4 (broken)</a></li>
    </ul>
    <div id="tabs-1">
        <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi
            sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus
            auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci.
            Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius
            sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
    </div>
</div>


</body>

</html>