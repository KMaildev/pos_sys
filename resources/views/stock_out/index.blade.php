@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Stock Out
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Stock Out
                        </li>
                    </ol>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-2">
                        <div class="col-sm-4">
                            <form action="{{ route('stock_out.index') }}" method="get" autocomplete="off">
                                <div class="input-group">
                                    <input type="date" class="form-control" name="start_date"
                                        value="{{ $start_date }}" />
                                    <input type="date" class="form-control" name="end_date"
                                        value="{{ $end_date }}" />
                                    <input type="submit" class="dt-button create-new btn btn-primary" value="Search">
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Item Code</th>
                                    <th class="text-center">Item Name</th>
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Used Unit</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $i = 1;
                                @endphp
                                @foreach ($order_items as $key => $order_item)
                                    @foreach ($order_item->ingredient_lists as $key => $ingredient_list)
                                        <tr>
                                            <td>
                                                {{ $i++ }}
                                            </td>

                                            <td class="text-center">
                                                {{ $ingredient_list->ingredient->item_code ?? '' }}
                                            </td>

                                            <td class="text-center">
                                                {{ $ingredient_list->ingredient->name ?? '' }}
                                            </td>

                                            <td class="text-center">
                                                {{ $order_item->order_date ?? '' }}
                                            </td>

                                            <td class="text-center">
                                                {{ $order_item->qty * $ingredient_list->qty }}
                                            </td>
                                        </tr>
                                    @endforeach
                                @endforeach
                            </tbody>
                        </table>
                        {{ $order_items->withQueryString()->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
