<!DOCTYPE HTML>
<html>
<head>
    <title>Sample Application</title>
</head>
<body>
<h1>Hello, ${name}!</h1>

<h2>Youuuu, ${test}</h2>

<form action="/ExcelPoiSample/uploadExcel" enctype="multipart/form-data" method="post">
    <input type="file" name="uploadFile"/>
    <input type="submit"/>
</form>
</body>
</html>