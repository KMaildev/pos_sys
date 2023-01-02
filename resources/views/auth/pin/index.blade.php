@extends('layouts.pin')
@section('content')
    <div class="col-md-12 col-lg-12 col-sm-12">

    </div>
    <div class="col-md-4 col-lg-4 col-sm-12" style="text-align: right">
        <form action="{{ route('pin_login') }}" method="post" id="form-id" autocomplete="off">
            @csrf

            <div class="result">
                <input id="mynumber" placeholder="0" name="pin_code" type="password" autocomplete="off" />
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

    <div class="col-md-6 col-lg-6 col-sm-12 py-4">
        <div class="alert alert-danger alert-dismissible alert-label-icon label-arrow fade show" role="alert"
            style="border-radius: 0px; background-color: black;">
            <i class="fa fa-bell label-icon"></i>
            <marquee behavior="" direction="" style="font-size: 17px; color: white;">
                <span>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolore, quos? Provident ratione fuga
                    consectetur
                    harum
                    vero, repudiandae consequatur optio nesciunt a deleniti, neque praesentium. Deleniti aperiam voluptas
                    nulla
                    qui
                    natus!
                </span>
            </marquee>
        </div>
    </div>
@endsection
