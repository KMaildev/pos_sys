@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Current Stock Situation
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
                                Current Stock Situation
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
                                    <th class="text-center">unit</th>
                                    <th class="text-center">Location</th>
                                    <th class="text-center">Opening Stock</th>
                                    <th class="text-center">Purchase</th>
                                    <th class="text-center">Sales</th>
                                    <th class="text-center">Damage</th>
                                    <th class="text-center">Closing Stock</th>
                                    <th class="text-center">Adjust Stock</th>
                                    <th class="text-center">Status</th>
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

                                        <td class="text-center">
                                            {{ $ingredient->unit ?? '' }}
                                        </td>

                                        {{-- Location --}}
                                        <td class="text-center">
                                            {{ $ingredient->stock_openings->store_table->name ?? '' }}
                                        </td>

                                        {{-- Opening Stock --}}
                                        <td class="text-center">
                                            {{ number_format($ingredient->stock_openings_all->sum('opening_unit'), 2) }}
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

                                        {{-- Damage --}}
                                        <td class="text-center">
                                            {{ number_format($ingredient->damages_all->sum('damage_unit'), 2) }}
                                        </td>

                                        {{-- Closing Stock --}}
                                        <td class="text-center">
                                            @php
                                                $opening_stock = $ingredient->stock_openings_all->sum('opening_unit');
                                                $purchase_unit = $ingredient->stock_ins_all->sum('purchase_unit');
                                                
                                                $sale_total_all = $sale_total_all;
                                                $damage_unit = $ingredient->damages_all->sum('damage_unit');
                                                
                                                $closing_stock = $opening_stock + $purchase_unit - ($sale_total_all + $damage_unit);
                                                echo $closing_stock;
                                                
                                            @endphp
                                        </td>

                                        {{-- Adjust Stock --}}
                                        <td class="text-center">

                                        </td>

                                        {{-- Status --}}
                                        <td class="text-center">

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
