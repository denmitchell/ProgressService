<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" href="#"/>
    <style>
        #myProgress {
            width: 100%;
            background-color: grey;
        }
        #myBar {
            width: 10%;
            height: 30px;
            background-color: grey;
        }

        #myBarCaption {
            display: table;
            margin: 0 auto;
            text-align: center; /* To center it horizontally (if you want) */
            line-height: 30px; /* To center it vertically */
            color: white; 
            visibility: hidden
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <title>AJAX Progress Bar</title>
</head>
<body>
    <div class="container">

        <form id="form1" runat="server">
            <div>
                <input type="button" onclick="StartTask();" value="Start Task" />
            </div>
            <div>
                <h2>Progress:</h2>
                <div id="myProgress">
                    <div id="myBar">
                        <div id ="myBarCaption">
                            <span id="progress">0</span>
                            <span id="percent-sign">%</span>
                        </div>
                    </div>
                </div>
                <h4 id="taskStatus"></h4>
            </div>
        </form>
        </div>
    <script>

        setInterval(GetProgress, 500);

        function StartTask() {
            $.ajax({
                'url': 'http://localhost:50042/ProgressService.svc/StartTask',
                'type': 'POST',
                'success': function(result){
                    $('#taskStatus').html('task started');
                }
            });
        }

        function GetProgress() {
            if ($('#taskStatus').html() !== 'task started')
                return;

            $('#progress').load('http://localhost:50042/ProgressService.svc/GetProgress');

            var progress = parseInt($('#progress').html());

            var width = progress < 10 ? 10 : progress;
            $('#myBar').width(width + '%');

            if (progress > 0) {
                $('#myBar').css('background-color', '#4CAF50');
                $('#myBarCaption').css('visibility', 'visible');
            }
            if (progress === 100)
                $('#taskStatus').html('task completed');
        }
    </script>
</body>
</html>
