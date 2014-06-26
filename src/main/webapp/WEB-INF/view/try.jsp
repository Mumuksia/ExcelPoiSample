<!doctype html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
    <script src="/ExcelPoiSample/js/fileUpload.js"></script>
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
<body>
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

<script src="/ExcelPoiSample/js/dhtmlxTabbar/codebase/dhtmlXTabbar.js"></script>
<script src="/ExcelPoiSample/js/dhtmlxTabbar/codebase/dhtmlXTabbar_start.js"></script>

<div id="a_tabbar" class="dhtmlxTabBar" imgpath="/ExcelPoiSample/js/dhtmlxTabbar/codebase/imgs/"
     style="width:390; height:390;" skinColors="#FCFBFC,#F4F3EE">
    <div id="a1" name="Tab 1">Content 1</div>
    <div id="a2" name="Tab 2">Content 2</div>
    <div id="a3" name="Tab 3">Content 3</div>
</div>

<div id="a_tabbar2" style="width:400;height:100"></div>
<script>
    tabbar = new dhtmlXTabBar("a_tabbar2");
    tabbar.setImagePath("/ExcelPoiSample/js/dhtmlxTabbar/codebase/imgs/");

    tabbar.addTab("a1", "Tab 1-1", "100px");
    tabbar.addTab("a2", "Tab 1-2", "100px");
    tabbar.addTab("a3", "Tab 1-3", "100px");
</script>

</body>

</html>