@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">Welcome !</h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="javascript: void(0);">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Welcome !</li>
                    </ol>
                </div>
            </div>
        </div>

        {{-- Count  --}}
        <div class="col-xl-3 col-sm-6 col-12">
            <div class="card shadow border-0" style="background-color: #FCD733">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <span class="h6 font-semibold text-muted text-sm d-block mb-2">
                                Total Order
                            </span>
                            <span class="h3 font-bold mb-0">
                                {{ $allOrderCount }}
                            </span>
                        </div>
                        <div class="col-auto">
                            <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                <i class="fa fa-home"></i>
                            </div>
                        </div>
                    </div>
                    <div class="mt-2 mb-0 text-sm">
                        <span class="badge badge-pill bg-soft-success text-white me-2" style="font-size: 14px;">
                            {{ $todayOrderCount }}
                        </span>
                        <span class="text-nowrap text-xs text-white" style="font-size: 14px;">
                            Today
                        </span>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-xl-3 col-sm-6 col-12">
            <div class="card shadow border-0" style="background-color: #8ECBFC">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <span class="h6 font-semibold text-muted text-sm d-block mb-2">
                                Total Income
                            </span>
                            <span class="h3 font-bold mb-0">
                                {{ number_format($allIncome, 2) }} KS
                            </span>
                        </div>
                        <div class="col-auto">
                            <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                <i class="bi bi-credit-card"></i>
                            </div>
                        </div>
                    </div>
                    <div class="mt-2 mb-0 text-sm">
                        <span class="badge badge-pill bg-soft-success text-white me-2" style="font-size: 14px;">
                            <i class="bi bi-arrow-up me-1"></i>
                            {{ number_format($todayIncome, 2) }} KS
                        </span>
                        <span class="text-nowrap text-xs text-white" style="font-size: 14px;">
                            Today
                        </span>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-xl-3 col-sm-6 col-12">
            <div class="card shadow border-0" style="background-color: #7DEB54">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <span class="h6 font-semibold text-muted text-sm d-block mb-2">
                                Total Customer
                            </span>
                            <span class="h3 font-bold mb-0">
                                {{ $allCustomer }}
                            </span>
                        </div>
                        <div class="col-auto">
                            <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                <i class="bi bi-credit-card"></i>
                            </div>
                        </div>
                    </div>
                    <div class="mt-2 mb-0 text-sm">
                        <span class="badge badge-pill bg-soft-success text-white me-2" style="font-size: 14px;">
                            <i class="bi bi-arrow-up me-1"></i>
                            {{ $todayCustomer }}
                        </span>
                        <span class="text-nowrap text-xs text-white" style="font-size: 14px;">
                            Today
                        </span>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-xl-3 col-sm-6 col-12">
            <div class="card shadow border-0" style="background-color: #26B7B7">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <span class="h6 font-semibold text-muted text-sm d-block mb-2">
                                Total Order Qty
                            </span>
                            <span class="h3 font-bold mb-0">
                                {{ $allOrderQty }}
                            </span>
                        </div>
                        <div class="col-auto">
                            <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                <i class="bi bi-credit-card"></i>
                            </div>
                        </div>
                    </div>
                    <div class="mt-2 mb-0 text-sm">
                        <span class="badge badge-pill bg-soft-success text-white me-2" style="font-size: 14px;">
                            <i class="bi bi-arrow-up me-1"></i>
                            {{ $todayOrderQty }}
                        </span>
                        <span class="text-nowrap text-xs text-white" style="font-size: 14px;">
                            Today
                        </span>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-6">
            <div class="card shadow border-0">
                <div class="card-body">
                    <canvas id="saleChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow border-0">
                <div class="card-body">
                    <canvas id="dailyIncomeChart"></canvas>
                </div>
            </div>
        </div>


        <div class="col-md-12">
            <div class="card shadow border-0">
                <div class="card-body">
                    <canvas id="itemsSaleReport"></canvas>
                </div>
            </div>
        </div>


        <div class="col-md-6">
            <div class="card shadow border-0">
                <div class="card-body">
                    <canvas id="categorySaleReport"></canvas>
                </div>
            </div>
        </div>


        {{-- <div class="col-md-6">
            <div class="card shadow border-0">
                <div class="card-body">
                    <canvas id="hourlyReport"></canvas>
                </div>
            </div>
        </div> --}}
        

    </div>
@endsection
@section('script')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('saleChart');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: @json($months),
                datasets: [{
                    label: '# Total Sale Order',
                    data: @json($saleData),
                    borderWidth: 1
                }]
            },
        });


        const dailyIncomeChart = document.getElementById('dailyIncomeChart');
        new Chart(dailyIncomeChart, {
            type: 'line',
            data: {
                labels: @json($dayMonths),
                datasets: [{
                    label: '# Daily Income',
                    data: @json($DailyIncome),
                    borderColor: 'black',
                    backgroundColor: 'green',
                    borderWidth: 1
                }]
            },
        });

        

        const categorySaleReport = document.getElementById('categorySaleReport');
        new Chart(categorySaleReport, {
            type: 'pie',
            data: {
                labels: @json($categories),
                datasets: [{
                    label: '# Category Sale Report',
                    data: @json($categorySaleReport),
                    borderWidth: 1
                }]
            },
        });


        const itemsSaleReport = document.getElementById('itemsSaleReport');
        new Chart(itemsSaleReport, {
            type: 'bar',
            data: {
                labels: @json($menuNameData),
                datasets: [{
                    label: '# Item Sale Report',
                    data: @json($menuQtyData),
                    borderWidth: 1
                }]
            },
        });


        const hourlyReport = document.getElementById('hourlyReport');
        new Chart(hourlyReport, {
            type: 'bar',
            data: {
                labels: @json($hourlyData),
                datasets: [{
                    label: '# Item Sale Report',
                    data: @json($HourlyIncome),
                    borderWidth: 1
                }]
            },
        });


        
    </script>
@endsection
