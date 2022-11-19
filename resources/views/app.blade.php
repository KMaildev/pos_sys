<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- plugin css -->
    <link href="{{ asset('pos/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css') }}" rel="stylesheet"
        type="text/css" />
    <!-- preloader css -->
    <link rel="stylesheet" href="{{ asset('pos/css/preloader.min.css') }}" type="text/css" />
    <!-- Bootstrap Css -->
    <link href="{{ asset('pos/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="{{ asset('pos/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="{{ asset('pos/css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css" />

    {{-- <link href="{{ asset('pos/libs/choices.js/public/pos/styles/choices.min.css') }}" rel="stylesheet"
        type="text/css" /> --}}

    <link rel="stylesheet" href="{{ asset('pos/libs/twitter-bootstrap-wizard/prettify.css') }}">
    <link rel="stylesheet" href="{{ asset('pos/css/pos.css') }}">

    <link href="{{ mix('/css/app.css') }}" rel="stylesheet" />
    @inertiaHead
    
</head>

<body data-topbar="dark" data-layout="horizontal">
    <div id="layout-wrapper">
        <div class="main-content">
            <div class="page-content" style="margin-top: 0px;">
                <div class="container-fluid">
                    @inertia
                </div>
            </div>
        </div>
    </div>
</body>

<script src="{{ asset('assets/libs/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/libs/metismenu/metisMenu.min.js') }}"></script>
<script src="{{ asset('assets/libs/feather-icons/feather.min.js') }}"></script>
{{-- <script src="{{ asset('assets/js/app.js') }}"></script> --}}
<script src="{{ asset('assets/js/sweetalert.min.js') }}"></script>
@routes
<script src="{{ mix('/js/app.js') }}" defer></script>
</html>
