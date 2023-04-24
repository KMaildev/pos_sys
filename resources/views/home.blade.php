@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Welcome !</h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                        <li class="breadcrumb-item active">Welcome !</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 py-5">
        <div class="card">
            <div class="card-body">
                <div style="height: 300px; width: 100%;">
                    <h6>{{ $customers->options['chart_title'] }}</h6>
                    {!! $customers->renderHtml() !!}
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 py-5">
        <div class="card">
            <div class="card-body">
                <div style="height: 300px; width: 100%;">
                    <h6>{{ $bill_infos->options['chart_title'] }}</h6>
                    {!! $bill_infos->renderHtml() !!}
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div style="height: 500px; width: 100%;">
                        <h6>{{ $order_items_price->options['chart_title'] }}</h6>
                        {!! $order_items_price->renderHtml() !!}
                    </div>
                </div>
            </div>
        </div>


        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div style="height: 500px; width: 100%;">
                        <h6>{{ $order_items->options['chart_title'] }}</h6>
                        {!! $order_items->renderHtml() !!}
                    </div>
                </div>
            </div>
        </div>


    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript">
        {!! $customers->renderChartJsLibrary() !!}
        {!! $customers->renderJs() !!}
        {!! $bill_infos->renderJs() !!}
        {!! $order_items->renderJs() !!}
        {!! $order_items_price->renderJs() !!}
    </script>
@endsection
