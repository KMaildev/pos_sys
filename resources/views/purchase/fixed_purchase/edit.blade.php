@extends('layouts.main')
@section('content')
    <div class="row">
        <form action="{{ route('fixed_purchase.update', $fixed_purchase->id) }}" method="post" id="create-form"
            enctype="multipart/form-data" autocomplete="off">
            @csrf
            @method('PUT')
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">
                            Fixed Assets Purchase Edit
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
                                        <select name="supplier_id" class="form-control select2" id="supplierId">
                                            <option value="">
                                                Select Supplier
                                            </option>
                                            @foreach ($suppliers as $supplier)
                                                <option value="{{ $supplier->id }}"
                                                    @if ($supplier->id == $fixed_purchase->supplier_id) selected @endif>
                                                    {{ $supplier->name ?? $supplier->phone }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('supplier_id')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                        Shop Name
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" readonly id="shopName">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                        Phone
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" readonly id="phone">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                        Address
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" readonly id="address">
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
                                            name="invoice_no" value="{{ $fixed_purchase->invoice_no ?? '' }}" />
                                        @error('invoice_no')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                        Pruchase Date
                                    </label>
                                    <div class="col-sm-9">
                                        <input class="form-control date_picker @error('purchase_date') is-invalid @enderror"
                                            type="text" name="purchase_date"
                                            value="{{ $fixed_purchase->purchase_date ?? '' }}" />
                                        @error('purchase_date')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="horizontal-firstname-input" class="col-sm-3 col-form-label">
                                        Remark
                                    </label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control @error('remark') is-invalid @enderror" rows="3" name="remark">{{ $fixed_purchase->remark ?? '' }}</textarea>
                                        @error('remark')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>

                            </div>
                        </div>

                        <hr class="mx-n4">

                        <div class="row">
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

                                        <th class="text-center" style="width: 1%;">
                                            Actions
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        {{-- Fixed Assets --}}
                                        <td>
                                            <select class="form-select select2" name="fixed_asset_id" id="fixedAssetsId">
                                                <option value="">
                                                    Select Items
                                                </option>
                                                @foreach ($fixed_assets as $fixed_asset)
                                                    <option value="{{ $fixed_asset->id }}">
                                                        {{ $fixed_asset->inventory_code ?? '' }}
                                                    </option>
                                                @endforeach
                                            </select>

                                            <input type="hidden" id="FixedAssetsName" class="form-control" readonly>
                                            <input type="hidden" id="Status" class="form-control" readonly
                                                value="fixed_purchase">
                                        </td>

                                        {{-- Description --}}
                                        <td>
                                            <input type="text" id="Description" class="form-control" readonly>
                                        </td>

                                        {{-- Unit --}}
                                        <td>
                                            <input type="text" id="Unit" class="form-control" readonly>
                                        </td>

                                        {{-- Quantity --}}
                                        <td>
                                            <input type="text" class="form-control" id="Qty"
                                                oninput="SetCalculator()" style="text-align: right">
                                        </td>

                                        {{-- Cost --}}
                                        <td>
                                            <input type="text" class="form-control" id="Cost"
                                                oninput="SetCalculator()" style="text-align: right">
                                        </td>

                                        {{-- Amount --}}
                                        <td>
                                            <input type="text" class="form-control" id="Amount"
                                                style="text-align: right">
                                        </td>

                                        {{-- Remark --}}
                                        <td>
                                            <input type="text" class="form-control" id="Remark">
                                        </td>

                                        {{-- Amount --}}
                                        <td>
                                            <button type="button" class="btn btn-primary"
                                                onclick="setPurchaseInvoiceCart()">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
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

                                            <td>
                                                <a href="{{ route('fixed_purchase_item_delete', $fixed_purchase_item->id) }}"
                                                    type="button" class="btn btn-danger">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tbody id="TempLists"></tbody>
                            </table>
                        </div>

                        <div class="row p-sm-3 p-0">
                            <div class="col-md-6">
                                <dl class="row mb-2">
                                    <div class="row mb-2">
                                        <label for="horizontal-firstname-input" class="col-sm-4 col-form-label">
                                            Attachment Files
                                        </label>
                                        <div class="col-sm-8">
                                            <input class="form-control @error('attachments') is-invalid @enderror"
                                                type="file" name="attachments[]" multiple />
                                            @error('attachments')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </dl>
                            </div>

                            <div class="col-md-6">
                                <dl class="row mb-2">

                                    <div class="row mb-3">
                                        <label class="col-sm-4 col-form-label">
                                            Total Amount
                                        </label>
                                        <div class="col-sm-8">
                                            @php
                                                $total_amount = array_sum($amount_total);
                                            @endphp

                                            <input type="text" class="form-control" style="text-align: right;"
                                                id="totalAmountShow" readonly>

                                            <input type="hidden" value="0" name="total_amount"
                                                id="totalAmountSave">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label class="col-sm-4 col-form-label">
                                            Representative
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="select2 form-select form-select-sm" data-allow-clear="false"
                                                name="representative_id">
                                                <option value="">-- Select Representative --</option>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}"
                                                        @if ($user->id == $fixed_purchase->representative_id) selected @endif>
                                                        {{ $user->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('representative_id')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row py-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary w-md" style='float: right;'>
                                                Save
                                            </button>
                                        </div>
                                    </div>

                                </dl>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\UpdateFIxedPurchase', '#create-form') !!}

    <script>
        function SetCalculator() {
            var Qty = document.getElementById("Qty").value;
            var Cost = document.getElementById("Cost").value;
            var AmountTotal = Qty * Cost;
            Amount.value = AmountTotal;
        }

        function setPurchaseInvoiceCart() {
            var fixedAssetsId = document.getElementById("fixedAssetsId").value;
            var FixedAssetsName = document.getElementById("FixedAssetsName").value;
            var qty = document.getElementById("Qty").value;
            var cost = document.getElementById("Cost").value;
            var remark = document.getElementById("Remark").value;
            var status = document.getElementById("Status").value;


            if (fixedAssetsId == null || fixedAssetsId == "") {
                alert("Please Select Item");
                return false;
            } else if (qty == null || qty == "" || isNaN(qty)) {
                alert("Qty: Enter Numeric value only.");
                return false;
            } else if (cost == null || cost == "" || isNaN(cost)) {
                alert("Cost: Enter Numeric value only.");
                return false;
            }

            var url = '{{ url('store_temp_fixed_purchase_item') }}';
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                method: 'POST',
                url: url,
                data: {
                    temp_id: fixedAssetsId,
                    temp_name: FixedAssetsName,
                    qty: qty,
                    cost: cost,
                    remark: remark,
                    status: status,
                },
                success: function(data) {
                    getTempData();
                },
                error: function(data) {}
            });
        }

        function getTempData() {
            var url = '{{ url('get_temp_fixed_purchase_item') }}';
            $.ajax({
                url: url,
                data: {
                    status: 'fixed_purchase',
                },
                method: "GET",
                success: function(data) {
                    let items = '';
                    var totalAmount = 0;
                    $.each(JSON.parse(data), function(key, value) {
                        totalAmount += value.qty * value.cost;
                        let k = key + 1;
                        items += '<tr>';
                        items += '<td>' + k + '</td>' //Sr.No	

                        // Fixed Assets	
                        items += '<td>'
                        items += value.temp_name;
                        items += '</td>'


                        // Description
                        items += '<td>'
                        items += value.fixed_assets_table.description;
                        items += '</td>'

                        // Unit
                        items += '<td>'
                        items += value.fixed_assets_table.unit;
                        items += '</td>'

                        // Order Quantity	
                        items += '<td style="text-align: right">'
                        items += value.qty;
                        items += '</td>'

                        // cost
                        items += '<td style="text-align: right">'
                        items += value.cost;
                        items += '</td>'

                        // Amount	
                        items += '<td style="text-align: right">'
                        items += value.qty * value.cost;
                        items += '</td>'

                        // Amount	
                        items += '<td>'
                        items += value.remark;
                        items += '</td>'

                        // Action
                        items += '<td>'
                        items +=
                            '<button type="button" class="btn btn-danger remove_item" data-id="' +
                            value.id + '"><i class="fa fa-trash"></i></button>'
                        items += '</td>'
                        items += '</tr>';
                    });
                    $('#TempLists').html(items);
                    var oldTotalAmount = '{{ $total_amount }}';
                    var showTotalAmount = +oldTotalAmount + +totalAmount;
                    totalAmountShow.value = (showTotalAmount).toLocaleString('en');
                    totalAmountSave.value = showTotalAmount;
                }
            });
        }
        getTempData();



        // RemoveItem
        $(document).on("click", ".remove_item", function() {
            var id = $(this).data('id');
            $.ajax({
                url: `/remove_temp_fixed_purchase_item/${id}`,
                method: "GET",
                success: function(data) {
                    getTempData();
                }
            });
        });


        $('select[id="fixedAssetsId"]').on('change', function() {
            var fixedAssetsId = $(this).val();
            if (fixedAssetsId) {
                $.ajax({
                    url: `/get_fixed_by_id/${fixedAssetsId}`,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        Description.value = data.description;
                        Unit.value = data.unit;
                        FixedAssetsName.value = data.inventory_code;
                    }
                });
            }
        });


        $('select[id="supplierId"]').on('change', function() {
            var supplierId = $(this).val();
            if (supplierId) {
                $.ajax({
                    url: `/get_supplier_by_id/${supplierId}`,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        shopName.value = data.shop_name;
                        address.value = data.address;
                        phone.value = data.phone;
                    }
                });
            }
        });

        function autoGetSupplierData() {
            var supplierId = '{{ $fixed_purchase->supplier_id }}'
            if (supplierId) {
                $.ajax({
                    url: `/get_supplier_by_id/${supplierId}`,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        shopName.value = data.shop_name;
                        address.value = data.address;
                        phone.value = data.phone;
                    }
                });
            }
        }
        autoGetSupplierData();
    </script>
@endsection
