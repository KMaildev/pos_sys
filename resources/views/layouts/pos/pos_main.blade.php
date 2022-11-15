@include('layouts.pos.includes.header')
@include('layouts.pos.includes.top')
{{-- @include('layouts.pos.includes.menu') --}}

<div class="main-content">
    <div class="page-content" style="margin-top: 0px;">
        <div class="container-fluid">
            @yield('content')
        </div>
    </div>
</div>

@include('layouts.pos.includes.pos_footer')
