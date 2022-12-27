@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Fixed Assets Damage
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Fixed Assets Damage
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
                            <form action="{{ route('fixed_damage.index') }}" method="get" autocomplete="off">
                                <div class="search-box me-2 mb-2 d-inline-block">
                                    <div class="position-relative">
                                        <input type="text" class="form-control" placeholder="Search..." name="q">
                                        <i class="bx bx-search-alt search-icon"></i>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-8">
                            <div class="text-sm-end">
                                <a href="{{ route('fixed_damage.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive" style="margin-bottom: 150px;">
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Inventory Code</th>
                                    <th class="text-center">Qty</th>
                                    <th class="text-center">Damage</th>
                                    <th class="text-center">Cause of Incident</th>
                                    <th class="text-center">Compensation</th>
                                    <th class="text-center">Voucher Attach</th>
                                    <th class="text-center">Number of Unit Left</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($fixed_damages as $key => $fixed_damage)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $fixed_damage->fixed_asset_table->inventory_code }}
                                        </td>

                                        <td class="text-center">
                                            {{ $fixed_damage->fixed_asset_table->fixed_purchase_items->sum('qty') }}
                                        </td>

                                        <td class="text-center">
                                            {{ $fixed_damage->damage_qty ?? 0 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $fixed_damage->causes_of_accidents ?? '' }}
                                        </td>


                                        <td class="text-center">
                                            {{ $fixed_damage->compensation ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            @if ($fixed_damage->voucher_attach)
                                                <img src="{{ Storage::url($fixed_damage->voucher_attach) }}" alt=""
                                                    style="width: 50px; height: 50px; background-position: center; background-size: contain, cover;">
                                            @endif
                                        </td>

                                        <td class="text-center">
                                            @php
                                                $total_qty = $fixed_damage->fixed_asset_table->fixed_purchase_items->sum('qty');
                                                $damage_qty = $fixed_damage->damage_qty ?? 0;
                                                $left_qty = $total_qty - $damage_qty;
                                                echo number_format($left_qty);
                                            @endphp
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
                                                        <a href="{{ route('fixed_damage.show', $fixed_damage->id) }}"
                                                            class="dropdown-item">
                                                            <i class="mdi mdi-pencil font-size-16 text-success me-1"></i>
                                                            View
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="{{ route('fixed_damage.edit', $fixed_damage->id) }}"
                                                            class="dropdown-item">
                                                            <i class="mdi mdi-pencil font-size-16 text-success me-1"></i>
                                                            Edit
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <form
                                                            action="{{ route('fixed_damage.destroy', $fixed_damage->id) }}"
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
