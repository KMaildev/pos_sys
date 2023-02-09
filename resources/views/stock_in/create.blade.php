@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Stock In Entry
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
                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable">
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
                                        Actions
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    {{-- Item Code	 --}}
                                    <td>
                                        <select class="form-control select2" name="ingredient_id" id="ingredientId">
                                            <option value="">
                                                -- Please Select --
                                            </option>
                                            @foreach ($ingredients as $ingredient)
                                                <option value="{{ $ingredient->id }}">
                                                    {{ $ingredient->name ?? '' }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('ingredient_id')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </td>

                                    {{-- Item Name	 --}}
                                    <td>
                                        <input type="text" id="ItemName" class="form-control" readonly>
                                    </td>

                                    {{-- Date --}}
                                    <td>
                                        <input type="date" id="Date" class="form-control">
                                    </td>

                                    {{-- Purchase unit --}}
                                    <td>
                                        <input type="text" id="PurchaseUnit" class="form-control"
                                            oninput="SetCalculator()">
                                    </td>

                                    {{-- Price per unit	 --}}
                                    <td>
                                        <input type="text" id="PricePerUnit" class="form-control"
                                            oninput="SetCalculator()">
                                    </td>

                                    {{-- Total Stock Value --}}
                                    <td>
                                        <input type="text" id="TotalStockValue" class="form-control" readonly>
                                    </td>

                                    <td>
                                        <select class="form-control select2" id="storeId">
                                            <option value="">
                                                Location
                                            </option>
                                            @foreach ($stores as $store)
                                                <option value="{{ $store->id }}">
                                                    {{ $store->name ?? '' }}
                                                    @
                                                    {{ $store->code_name ?? '' }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </td>

                                    <td>
                                        <button type="button" class="btn btn-primary" onclick="addOpeningStock()">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody id="openingStockLists"></tbody>
                        </table>

                        <div style="text-align: right">
                            <a href="{{ route('confirm_stock_in_entry') }}" class="btn btn-primary float-right">
                                Confirm
                            </a>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\StoreFixedPurchase', '#create-form') !!}
    <script>
        $('select[id="ingredientId"]').on('change', function() {
            var ingredientId = $(this).val();
            if (ingredientId) {
                $.ajax({
                    url: `/ingredients_by_id/${ingredientId}`,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        ItemName.value = data.item_code
                    }
                });
            }
        });

        function SetCalculator() {
            var PurchaseUnit = document.getElementById("PurchaseUnit").value;
            var PricePerUnit = document.getElementById("PricePerUnit").value;
            var TotalStockValue = +PurchaseUnit * +PricePerUnit;
            document.getElementById("TotalStockValue").value = TotalStockValue;
        }


        function addOpeningStock() {
            var ingredientId = document.getElementById("ingredientId").value;
            var Date = document.getElementById("Date").value;
            var PurchaseUnit = document.getElementById("PurchaseUnit").value;
            var PricePerUnit = document.getElementById("PricePerUnit").value;
            var TotalStockValue = document.getElementById("TotalStockValue").value;
            var storeId = document.getElementById("storeId").value;


            if (ingredientId == null || ingredientId == "") {
                alert("Please Select Item Code");
                return false;
            } else if (Date == null || Date == "") {
                alert("Please Enter Date");
                return false;
            } else if (PurchaseUnit == null || PurchaseUnit == "" || isNaN(PurchaseUnit)) {
                alert("Please Enter Opening Unit");
                return false;
            } else if (PricePerUnit == null || PricePerUnit == "" || isNaN(PricePerUnit)) {
                alert("Please Enter Price per unit");
                return false;
            } else if (storeId == null || storeId == "") {
                alert("Please Select Location");
                return false;
            }

            var url = '{{ url('stock_in_entry') }}';
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                method: 'POST',
                url: url,
                data: {
                    ingredient_id: ingredientId,
                    stock_in_date: Date,
                    purchase_unit: PurchaseUnit,
                    price_per_unit: PricePerUnit,
                    total_stock_value: TotalStockValue,
                    store_id: storeId,
                },
                success: function(data) {
                    getopeningStockEntryAjax();
                },
                error: function(data) {}
            });
        }

        function getopeningStockEntryAjax() {
            var url = '{{ url('get_stock_in_entry') }}';
            $.ajax({
                url: url,
                method: "GET",
                success: function(data) {
                    let items = '';
                    var totalAmount = 0;
                    $.each(JSON.parse(data), function(key, value) {
                        let k = key + 1;
                        items += '<tr>';
                        items += '<td>' + k + '</td>'

                        // Item Code
                        items += '<td>'
                        items += value.ingredient_table.item_code;
                        items += '</td>'

                        // Item Name	
                        items += '<td>'
                        items += value.ingredient_table.name;
                        items += '</td>'

                        // Date
                        items += '<td>'
                        items += value.stock_in_date;
                        items += '</td>'

                        // Opening Unit	
                        items += '<td>'
                        items += value.purchase_unit;
                        items += '</td>'

                        //Price per unit	
                        items += '<td>'
                        items += value.price_per_unit;
                        items += '</td>'

                        //Total Stock Value	
                        items += '<td>'
                        items += value.total_stock_value;
                        items += '</td>'

                        //Total Stock Value	
                        items += '<td>'
                        items += value.store_table.name;
                        items += '</td>'

                        items += '<td>'
                        items +=
                            '<button type="button" class="btn btn-danger remove_item" data-id="' +
                            value.id + '"><i class="fa fa-trash"></i></button>'
                        items += '</td>'

                        items += '</tr>';
                    });
                    $('#openingStockLists').html(items);
                }
            });
        }
        getopeningStockEntryAjax();

        // RemoveItem
        $(document).on("click", ".remove_item", function() {
            var id = $(this).data('id');
            $.ajax({
                url: `/remove_stock_in/${id}`,
                method: "GET",
                success: function(data) {
                    getopeningStockEntryAjax();
                }
            });
        });
    </script>
@endsection
