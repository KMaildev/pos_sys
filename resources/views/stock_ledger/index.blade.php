@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Stock Ledger
                </h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Stock Ledger
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
                            <h4>
                                Stock Ledger
                            </h4>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Item Code</th>
                                    <th class="text-center">Item Name</th>
                                    <th class="text-center">Purchase Unit</th>
                                    <th class="text-center">Sales Unit</th>
                                    <th class="text-center">Balance</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($ingredients as $key => $ingredient)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $ingredient->item_code ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $ingredient->name ?? '' }}
                                        </td>


                                        {{-- Purchase --}}
                                        <td class="text-center">
                                            {{ number_format($ingredient->stock_ins_all->sum('purchase_unit'), 2) }}
                                        </td>

                                        {{-- Sale --}}
                                        <td class="text-center">
                                            @php
                                                $sale_total = [];
                                                foreach ($ingredient->ingredient_lists_all as $ingredient_list) {
                                                    $menu_list_id = $ingredient_list->menu_list_id;
                                                    $ingredient_lists_qty = $ingredient_list->qty;
                                                    foreach ($order_items as $order_item) {
                                                        if ($menu_list_id == $order_item->menu_list_id) {
                                                            $order_item_qty = $order_item->qty;
                                                            $sale_total[] = $ingredient_lists_qty * $order_item_qty;
                                                        }
                                                    }
                                                }
                                                $sale_total_all = array_sum($sale_total);
                                                echo number_format($sale_total_all);
                                            @endphp
                                        </td>

                                        {{-- Balance --}}
                                        <td class="text-center">
                                            @php
                                                $purchase_unit = $ingredient->stock_ins_all->sum('purchase_unit');
                                                $balance = $purchase_unit - $sale_total_all;
                                                echo $balance;
                                            @endphp
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
