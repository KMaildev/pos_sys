@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Stock Transfer
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Stock Transfer
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
                        <div class="col-sm-12">
                            <div class="text-sm-end">
                                @include('layouts.includes.excel')
                                <a href="{{ route('stock_transfer.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
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
                                        Unit
                                    </th>

                                    <th class="text-center">
                                        Transfer Unit
                                    </th>

                                    <th class="text-center">
                                        Location From
                                    </th>

                                    <th class="text-center">
                                        To Location
                                    </th>

                                    <th class="text-center">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($stock_transfers as $key => $stock_transfer)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->ingredient_table->item_code ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->ingredient_table->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->transfer_date ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->ingredient_table->unit ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->transfer_unit ?? 0 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->location_from->code_name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_transfer->to_location->code_name ?? '' }}
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
                                                        <a href="{{ route('stock_transfer.edit', $stock_transfer->id) }}"
                                                            class="dropdown-item">
                                                            <i class="mdi mdi-pencil font-size-16 text-success me-1"></i>
                                                            Edit
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <form
                                                            action="{{ route('stock_transfer.destroy', $stock_transfer->id) }}"
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
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
