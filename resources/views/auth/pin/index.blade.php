@extends('layouts.pin')
@section('content')
    <style>
        #screen {
            display: block;
            background: #41444b;
            height: 100vh
        }

        #timeZone {
            display: inline-block;
            position: fixed;
            left: 45%;
            top: 30%;
            margin: auto;
            float: center;
            border-bottom: #ffd31d solid 2px;
        }

        p {
            text-align: center;
            color: #fddb3a;
            text-shadow: 0px 0px 100px rgba(255, 211, 29, 1);
        }

        #time {
            font-size: 75px;
            font-weight: bold;
        }

        #date {
            font-size: 30px;
        }

        #description {
            font-size: 15px;
            font-weight: bold;
            margin: 10px;
        }
    </style>
    <div class="col-md-12 col-lg-12 col-sm-12"></div>

    <div class="col-md-4 col-lg-4 col-sm-12" style="text-align: right">
        <form action="{{ route('pin_login') }}" method="post" id="form-id" autocomplete="off">
            @csrf

            <div class="result">
                <input id="mynumber" placeholder="0" name="pin_code" type="password" autocomplete="off" required="" />
            </div>

            <div class="container">
                <ul class="keypad">
                    <a href="#" class="press" id="7">
                        <li class="button">
                            <p class="number">7</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="8">
                        <li class="button">
                            <p class="number">8</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="9">
                        <li class="button">
                            <p class="number">9</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="4">
                        <li class="button">
                            <p class="number">4</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="5">
                        <li class="button">
                            <p class="number">5</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="6">
                        <li class="button">
                            <p class="number">6</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="1">
                        <li class="button">
                            <p class="number">1</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="2">
                        <li class="button">
                            <p class="number">2</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="3">
                        <li class="button">
                            <p class="number">3</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="DEL">
                        <li class="button clear">
                            <p class="number">C</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="0">
                        <li class="button">
                            <p class="number">0</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                    <a href="#" class="press" id="GO">
                        <li class="button go">
                            <p class="number">OK</p>
                        </li>
                        <div class="clearfix"></div>
                    </a>
                </ul>
            </div>
        </form>
    </div>

    <div class="col-md-6 col-lg-6 col-sm-12 py-5">
        <br><br><br><br><br><br><br><br>
        <center>

            <body onload="startTime()">
                <div id="clockdate">
                    <div class="clockdate-wrapper">
                        <div id="clock"
                            style="font-size: 150px;
                            color: rgb(239, 237, 237); 
                            font-family: myFirstFont;
                            display: inline-block;
                            transform: scale(1, 1.5);
                            ">
                        </div>
                        <div id="date"
                            style="
                                font-size: 60px;  
                                color: rgb(165, 162, 162);
                                font-family: myFirstFont;">
                        </div>
                    </div>
                </div>
            </body>
        </center>
    </div>
@endsection

<script>
    function startTime() {
        var today = new Date();
        var hr = today.getHours();
        var min = today.getMinutes();
        var sec = today.getSeconds();
        ap = (hr < 12) ? "<span>AM</span>" : "<span>PM</span>";
        hr = (hr == 0) ? 12 : hr;
        hr = (hr > 12) ? hr - 12 : hr;
        //Add a zero in front of numbers<10
        hr = checkTime(hr);
        min = checkTime(min);
        sec = checkTime(sec);
        document.getElementById("clock").innerHTML = hr + ":" + min + ":" + sec + " " + ap;

        var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October',
            'November', 'December'
        ];
        var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        var curWeekDay = days[today.getDay()];
        var curDay = today.getDate();
        var curMonth = months[today.getMonth()];
        var curYear = today.getFullYear();
        var date = curWeekDay + ", " + curDay + " " + curMonth + " " + curYear;
        document.getElementById("date").innerHTML = date;

        var time = setTimeout(function() {
            startTime()
        }, 500);
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
</script>
