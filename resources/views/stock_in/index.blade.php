@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Stock In
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Stock In
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
                            <form action="{{ route('stock_in.index') }}" method="get" autocomplete="off">
                                <div class="input-group">
                                    <input type="date" class="form-control" name="start_date"
                                        value="{{ $start_date }}" />
                                    <input type="date" class="form-control" name="end_date"
                                        value="{{ $end_date }}" />
                                    <input type="submit" class="dt-button create-new btn btn-primary" value="Search">
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-8">
                            <div class="text-sm-end">
                                @include('layouts.includes.excel')
                                <a href="{{ route('stock_in.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <span>
                            {{ $start_date }}
                            -
                            {{ $end_date }}
                        </span>
                        <table class="table table-bordered mydatatable" id="tableId">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">
                                        #
                                    </th>

                                    <th class="text-center">
                                        Item Code
                                    </th>

                                    <th class="text-center">
                                        Item Name
                                    </th>

                                    <th class="text-center">
                                        Date
                                    </th>

                                    <th class="text-center">
                                        Purchase unit
                                    </th>

                                    <th class="text-center">
                                        Price per unit
                                    </th>

                                    <th class="text-center">
                                        Total Stock Value
                                    </th>

                                    <th class="text-center">
                                        Location
                                    </th>

                                    <th class="text-center">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($stock_openings as $key => $stock_opening)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->ingredient_table->item_code ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->ingredient_table->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->stock_in_date ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ number_format($stock_opening->purchase_unit, 2) }}
                                        </td>

                                        <td class="text-center">
                                            {{ number_format($stock_opening->price_per_unit, 2) }}
                                        </td>

                                        <td class="text-center">
                                            {{ number_format($stock_opening->total_stock_value, 2) }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->store_table->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            <div class="dropdown">
                                                <a href="#"
                                                    class="dropdown-toggle card-drop btn btn-sm btn-primary text-white"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    Action
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end" style="">
                                                    <li>
                                                        <form action="{{ route('stock_in.destroy', $stock_opening->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="dropdown-item del_confirm"
                                                                id="confirm-text">
                                                                <i
                                                                    class="mdi mdi-trash-can font-size-16 text-danger me-1"></i>
                                                                Delete
                                                            </button>
                                                        </form>

                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tr>
                                <td colspan="4">
                                    Total
                                </td>

                                <td class="text-center">
                                    {{ number_format($stock_openings->sum('purchase_unit'), 2) }}
                                </td>

                                <td class="text-center">
                                    {{ number_format($stock_openings->sum('price_per_unit'), 2) }}
                                </td>

                                <td class="text-center">
                                    {{ number_format($stock_openings->sum('total_stock_value'), 2) }}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
