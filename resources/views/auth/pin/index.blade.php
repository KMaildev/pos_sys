@extends('layouts.pin')
@section('content')
    <form action="{{ route('pin_login') }}" method="post" id="form-id">
        @csrf

        <div class="result">
            <input id="mynumber" placeholder="0" name="pin_code" />
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
                        <p class="number">DEL</p>
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
                        <p class="number">GO</p>
                    </li>
                    <div class="clearfix"></div>
                </a>
            </ul>
        </div>
    </form>

    
@endsection
