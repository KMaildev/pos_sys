@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Fixed Assets Purchase
                    </h4>
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

                    <div class="row py-4">
                        <div class="col-md-12">

                            <h4 class="card-title">
                                Attachment Files
                            </h4>
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

                                            <td class="text-center">
                                                <form
                                                    action="{{ route('attachment_files_delete', $fixed_purchase_file->id) }}"
                                                    method="POST">
                                                    @csrf
                                                    <button type="submit" class="btn btn-danger del_confirm"
                                                        id="confirm-text">
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
    </div>
@endsection
@section('script')
@endsection
