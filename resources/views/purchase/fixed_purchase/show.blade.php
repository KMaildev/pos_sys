@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Fixed Assets Purchase
                    </h4>

                    <a href="{{ route('fixed_purchase.edit', $fixed_purchase->id) }}" style="float: right;"
                        class="btn btn-primary">
                        <i class="mdi mdi-pencil font-size-16 text-white me-1"></i>
                        Edit
                    </a>
                </div>


                <div class="card-body p-4">

                    <div class="row p-sm-3 p-0">
                        <div class="col-md-6">
                            <div class="row mb-2">
                                <label for="html5-text-input" class="col-md-3 col-form-label">
                                    Supplier
                                </label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" readonly
                                        value="{{ $fixed_purchase->supplier_table->name ?? '' }}">
                                </div>
                            </div>

                            <div class="row mb-2">
                                <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                    Shop Name
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly
                                        value="{{ $fixed_purchase->supplier_table->shop_name ?? '' }}">
                                </div>
                            </div>

                            <div class="row mb-2">
                                <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                    Phone
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly
                                        value="{{ $fixed_purchase->supplier_table->phone ?? '' }}">
                                </div>
                            </div>

                            <div class="row mb-2">
                                <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                    Address
                                </label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" readonly
                                        value="{{ $fixed_purchase->supplier_table->address ?? '' }}">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">

                            <div class="row mb-2">
                                <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                    Invoice No
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control @error('invoice_no') is-invalid @enderror" type="text"
                                        name="invoice_no" value="{{ $fixed_purchase->invoice_no ?? '' }}" readonly />
                                </div>
                            </div>

                            <div class="row mb-2">
                                <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                    Pruchase Date
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control @error('purchase_date') is-invalid @enderror" type="text"
                                        name="purchase_date" value="{{ $fixed_purchase->purchase_date ?? '' }}" readonly />
                                </div>
                            </div>

                            <div class="row mb-2">
                                <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                    Remark
                                </label>
                                <div class="col-sm-9">
                                    <textarea class="form-control @error('remark') is-invalid @enderror" rows="3" name="remark" readonly>{{ $fixed_purchase->remark ?? '' }}</textarea>
                                    @error('remark')
                                        <div class="invalid-feedback"> {{ $message }} </div>
                                    @enderror
                                </div>
                            </div>

                        </div>
                    </div>

                    <hr class="mx-n4">

                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-bordered mydatatable">
                                <thead class="table-light">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            #
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Fixed Assets
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Description
                                        </th>

                                        <th class="text-center" style="width: 7%;">
                                            Unit
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Quantity
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Cost
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Amount
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Remark
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $amount_total = [];
                                    @endphp
                                    @foreach ($fixed_purchase_items as $key => $fixed_purchase_item)
                                        <tr>
                                            <td>
                                                {{ $key + 1 }}
                                            </td>

                                            <td>
                                                {{ $fixed_purchase_item->fixed_asset_table->inventory_code ?? '' }}
                                            </td>

                                            <td>
                                                {{ $fixed_purchase_item->fixed_asset_table->description ?? '' }}
                                            </td>

                                            <td>
                                                {{ $fixed_purchase_item->fixed_asset_table->unit ?? '' }}
                                            </td>

                                            <td style="text-align: right">
                                                @php
                                                    $qty = $fixed_purchase_item->qty ?? 0;
                                                    echo number_format($qty, 2);
                                                @endphp
                                            </td>

                                            <td style="text-align: right">
                                                @php
                                                    $cost = $fixed_purchase_item->cost ?? 0;
                                                    echo number_format($cost, 2);
                                                @endphp
                                            </td>

                                            <td style="text-align: right">
                                                @php
                                                    $amount = $qty * $cost;
                                                    echo number_format($amount, 2);
                                                    $amount_total[] = $amount;
                                                @endphp
                                            </td>

                                            <td>
                                                {{ $fixed_purchase_item->remark ?? '' }}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row py-4">
                        <div class="col-md-8">
                            Attachment Files
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
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($fixed_purchase_files as $key => $fixed_purchase_file)
                                        <tr>
                                            <td>
                                                {{ $key + 1 }}
                                            </td>

                                            <td class="text-center">
                                                {{ $fixed_purchase_file->original_name ?? '' }}
                                            </td>

                                            <td class="text-center">
                                                <a href="{{ Storage::url($fixed_purchase_file->attachments) }}"
                                                    download="{{ $fixed_purchase_file->original_name }}">
                                                    <i class="fa fa-download fa-lg text-danger"></i>
                                                    <strong>Download</strong>
                                                </a>
                                            </td>

                                            <td class="text-center">
                                                {{ $fixed_purchase_file->date_at ?? '' }}
                                            </td>

                                            <td class="text-center">
                                                {{ $fixed_purchase_file->user_table->name ?? '' }}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div class="col-md-4">
                            <dl class="row mb-2">

                                <div class="row mb-3">
                                    <label class="col-sm-4 col-form-label">
                                        Total Amount
                                    </label>
                                    <div class="col-sm-8">
                                        @php
                                            $total_amount = array_sum($amount_total);
                                        @endphp
                                        <input type="text" class="form-control" style="text-align: right;" readonly
                                            value="{{ number_format($total_amount, 2) }}">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-sm-4 col-form-label">
                                        Representative
                                    </label>
                                    <div class="col-sm-8" style="text-align: right;">
                                        <input type="text" class="form-control" style="text-align: right;" readonly
                                            value="{{ $fixed_purchase->representative_table->name ?? '' }}">

                                    </div>
                                </div>
                            </dl>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
@endsection
