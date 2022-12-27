@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Variable Assets Damage
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Variable Assets Damage
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
                    <div class="table-responsive">
                        <h5>
                            Variable Assets Damage
                        </h5>
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center">Inventory Code</th>
                                    <th class="text-center">Qty</th>
                                    <th class="text-center">Damage</th>
                                    <th class="text-center">Cause of Incident</th>
                                    <th class="text-center">Compensation</th>
                                    <th class="text-center">Voucher Attach</th>
                                    <th class="text-center">Number of Unit Left</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">
                                        {{ $variable_damage->variable_asset_table->inventory_code }}
                                    </td>

                                    <td class="text-center">
                                        {{ $variable_damage->variable_asset_table->variable_purchase_items->sum('qty') }}
                                    </td>

                                    <td class="text-center">
                                        {{ $variable_damage->damage_qty ?? 0 }}
                                    </td>

                                    <td class="text-center">
                                        {{ $variable_damage->causes_of_accidents ?? '' }}
                                    </td>


                                    <td class="text-center">
                                        {{ $variable_damage->compensation ?? '' }}
                                    </td>

                                    <td class="text-center">
                                        @if ($variable_damage->voucher_attach)
                                            <img src="{{ Storage::url($variable_damage->voucher_attach) }}" alt=""
                                                style="width: 50px; height: 50px; background-position: center; background-size: contain, cover;">
                                        @endif
                                    </td>

                                    <td class="text-center">
                                        @php
                                            $total_qty = $variable_damage->variable_asset_table->variable_purchase_items->sum('qty');
                                            $damage_qty = $variable_damage->damage_qty ?? 0;
                                            $left_qty = $total_qty - $damage_qty;
                                            echo number_format($left_qty);
                                        @endphp
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <h5>
                            Proof Photo
                        </h5>
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">
                                        #
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        File Name
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Download
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Upload Date
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Upload By
                                    </th>

                                    <th class="text-center" style="width: 5%;">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($variable_damange_files as $key => $variable_damange_file)
                                    <tr>
                                        <td>
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $variable_damange_file->original_name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            <a href="{{ Storage::url($variable_damange_file->attachments) }}"
                                                download="{{ $variable_damange_file->original_name }}">
                                                <i class="fa fa-download fa-lg text-danger"></i>
                                                <strong>Download</strong>
                                            </a>
                                        </td>

                                        <td class="text-center">
                                            {{ $variable_damange_file->date_at ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $variable_damange_file->user_table->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            <form
                                                action="{{ route('attachment_files_delete', $variable_damange_file->id) }}"
                                                method="POST">
                                                @csrf
                                                <button type="submit" class="btn btn-danger del_confirm" id="confirm-text">
                                                    Delete
                                                </button>
                                            </form>
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
