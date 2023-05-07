$chart_options = [
    'chart_title' => 'Customers by months',
    'report_type' => 'group_by_date',
    'model' => 'App\Models\Customer',
    'group_by_field' => 'created_at',
    'group_by_period' => 'month',
    'chart_type' => 'bar',
    'filter_field' => 'created_at',
    'filter_days' => 30, // show only last 30 days
];
$customers = new LaravelChart($chart_options);


$chart_options = [
    'chart_title' => 'Daily Income',
    'report_type' => 'group_by_date',
    'model' => 'App\Models\BillInfo',
    'group_by_field' => 'created_at',
    'group_by_period' => 'day',
    'aggregate_function' => 'sum',
    'aggregate_field' => 'total_amount',
    'chart_type' => 'line',
];
$bill_infos = new LaravelChart($chart_options);


$chart_options = [
    'chart_title' => 'Sold out qty',
    'report_type' => 'group_by_string',
    'model' => 'App\Models\OrderItem',
    'group_by_field' => 'menu_name',
    'chart_type' => 'line',
    'filter_field' => 'created_at',
    'aggregate_function' => 'sum',
    'aggregate_field' => 'qty',
    'filter_period' => 'month', // show users only registered this month
];
$order_items = new LaravelChart($chart_options);


$chart_options = [
    'chart_title' => 'Revenue of Types',
    'report_type' => 'group_by_string',
    'model' => 'App\Models\OrderItem',
    'group_by_field' => 'type',
    'chart_type' => 'pie',
    'filter_field' => 'created_at',
    'aggregate_function' => 'sum',
    'aggregate_field' => 'price',
    'filter_period' => 'month', // show users only registered this month
];
$order_items_price = new LaravelChart($chart_options);


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