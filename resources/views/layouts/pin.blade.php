<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Enter PIN</title>
    <link rel="stylesheet" href="{{ asset('assets/pin/css/main.css') }}" />

    <meta name="theme-color" content="#fffff" />
    <link rel="apple-touch-icon" href="{{ asset('logo.png') }}">
    <link rel="manifest" href="{{ asset('/manifest.json') }}">
    <link href="{{ asset('pos/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('assets/ds_digital/DS-DIGI.TTF') }}">

    <style>
        @font-face {
            font-family: myFirstFont;
            src: url({{ asset('assets/ds_digital/DS-DIGI.TTF') }});
        }
    </style>
</head>

<body>
    <div class="background py-5">
        <div class="row d-flex justify-content-center">
            @yield('content')
        </div>
    </div>
</body>

<script src="{{ asset('assets/libs/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('assets/pin/js/pin.js') }}"></script>
<script src="{{ asset('/sw.js') }}"></script>
<script>
    if (!navigator.serviceWorker.controller) {
        navigator.serviceWorker.register("/sw.js").then(function(reg) {
            console.log("Service worker has been registered for scope: " + reg.scope);
        });
    }
</script>

</html>
