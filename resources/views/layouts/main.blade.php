@include('layouts.includes.header')
@include('layouts.includes.top')
@include('layouts.includes.menu')

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            @yield('content')
        </div>
    </div>
</div>

@include('layouts.includes.footer')
