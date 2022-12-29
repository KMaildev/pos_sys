@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Add Ingredients
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Menu Lists
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
                    <h5>
                        Menu
                    </h5>
                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 20%;">Menu Name</th>
                                    <th class="text-center" style="width: 20%;">Menu Name MM</th>
                                    <th class="text-center" style="width: 20%;">Price</th>
                                    <th class="text-center" style="width: 20%;">Category</th>
                                    <th class="text-center" style="width: 20%;">Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">
                                        {{ $menu_list->menu_name ?? '' }}
                                    </td>

                                    <td class="text-center">
                                        {{ $menu_list->menu_name_mm ?? '' }}
                                    </td>

                                    <td class="text-center">
                                        {{ number_format($menu_list->price, 2 ?? 0) }}
                                    </td>

                                    <td class="text-center">
                                        {{ $menu_list->category_table->title ?? '' }}
                                    </td>

                                    <td class="text-center">
                                        {{ $menu_list->category_table->type ?? '' }}
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


                <div class="card-body">
                    <h5>
                        Add Ingredients
                    </h5>
                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center" style="width: 1%;">
                                        No
                                    </th>

                                    <th class="text-center" style="width: 20%;">
                                        Ingredients
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Unit
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Quantity
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Gram to Kg
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        1kg Price
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        1kg per Price
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Price/ Kg
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Amount
                                    </th>

                                    <th class="text-center" style="width: 10%;">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>

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
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                        <input type="hidden" id="Name" class="form-control" readonly>
                                        <input type="hidden" id="MenuId" class="form-control"
                                            value="{{ $menu_list->id }}">
                                    </td>

                                    {{-- Unit --}}
                                    <td>
                                        <input type="text" id="Unit" class="form-control" readonly>
                                    </td>


                                    {{-- Quantity --}}
                                    <td>
                                        <input type="text" id="Qty" class="form-control" oninput="SetCalculator()"
                                            name="qty">
                                    </td>

                                    {{-- Gram to Kg	 --}}
                                    <td>
                                        <input type="text" id="GramToKg" class="form-control" readonly
                                            name="gram_to_kg">
                                    </td>

                                    {{-- 1 kg Price --}}
                                    <td>
                                        <input type="text" class="form-control" name="one_kg_price"
                                            oninput="SetCalculator()" id="oneKgPrice">
                                    </td>

                                    {{-- 1 kg Per Price --}}
                                    <td>
                                        <input type="text" class="form-control" name="per_kg_price" id="oneKgPerPrice">
                                    </td>

                                    {{-- Price/kg --}}
                                    <td>
                                        <input type="text" class="form-control" name="price_kg" oninput="SetCalculator()"
                                            id="priceKg">
                                    </td>

                                    {{-- Total Amount --}}
                                    <td>
                                        <input type="text" id="TotalAmount" class="form-control" readonly name="amount">
                                    </td>

                                    <td>
                                        <button type="button" class="btn btn-primary" onclick="addIngredient()">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>

                            <tbody id="ingredientLists"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\StoreFixedPurchase', '#create-form') !!}
    <script>
        function SetCalculator() {
            var Qty = document.getElementById("Qty").value;
            var TotalGramToKg = Qty / 1000;
            GramToKg.value = TotalGramToKg;

            var oneKgPrice = document.getElementById("oneKgPrice").value;
            var totalOneKgPerPrice = TotalGramToKg * oneKgPrice;
            oneKgPerPrice.value = totalOneKgPerPrice;


            var priceKg = document.getElementById("priceKg").value;
            var amountTotal = priceKg * Qty;
            TotalAmount.value = amountTotal;
        }

        $('select[id="ingredientId"]').on('change', function() {
            var ingredientId = $(this).val();
            if (ingredientId) {
                $.ajax({
                    url: `/ingredients_by_id/${ingredientId}`,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        Unit.value = data.unit;
                        Name.value = data.name;
                    }
                });
            }
        });

        function addIngredient() {
            var MenuId = document.getElementById("MenuId").value;
            var ingredientId = document.getElementById("ingredientId").value;
            var Name = document.getElementById("Name").value;
            var qty = document.getElementById("Qty").value;
            var GramToKg = document.getElementById("GramToKg").value;
            var oneKgPrice = document.getElementById("oneKgPrice").value;
            var priceKg = document.getElementById("priceKg").value;
            var TotalAmount = document.getElementById("TotalAmount").value;
            var Unit = document.getElementById("Unit").value;
            var oneKgPerPrice = document.getElementById("oneKgPerPrice").value;

            if (ingredientId == null || ingredientId == "") {
                alert("Please Select");
                return false;
            } else if (qty == null || qty == "" || isNaN(qty)) {
                alert("Qty: Enter Numeric value only.");
                return false;
            } else if (MenuId == null || MenuId == "" || isNaN(MenuId)) {
                return false;
            }

            var url = '{{ url('store_ingredient_list') }}';
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                method: 'POST',
                url: url,
                data: {
                    menu_list_id: MenuId,
                    ingredient_id: ingredientId,
                    ingredient_name: Name,
                    qty: qty,
                    one_kg_price: oneKgPrice,
                    price_kg: priceKg,
                    total_amount: TotalAmount,
                    gram_to_kg: GramToKg,
                    unit: Unit,
                    one_kg_per_price: oneKgPerPrice,
                },
                success: function(data) {
                    getIngredientLists();
                },
                error: function(data) {}
            });
        }

        function getIngredientLists() {
            var url = '{{ url('get_ingredient_list') }}';
            var menu_list_id = '{{ $menu_list->id }}'
            $.ajax({
                url: url,
                data: {
                    menu_list_id: menu_list_id,
                },
                method: "GET",
                success: function(data) {
                    let items = '';
                    var totalAmount = 0;
                    $.each(JSON.parse(data), function(key, value) {
                        let k = key + 1;
                        items += '<tr>';
                        items += '<td>' + k + '</td>' //Sr.No	

                        // Ingredients
                        items += '<td>'
                        items += value.ingredient_name;
                        items += '</td>'

                        // Unit 
                        items += '<td>'
                        items += value.unit;
                        items += '</td>'

                        // Quantity
                        items += '<td>'
                        items += value.qty;
                        items += '</td>'

                        // Gram to Kg	
                        items += '<td>'
                        items += value.gram_to_kg;
                        items += '</td>'

                        // 1kg Price	
                        items += '<td>'
                        items += value.one_kg_price;
                        items += '</td>'

                        // 1kg per Price	
                        items += '<td>'
                        items += value.one_kg_per_price;
                        items += '</td>'

                        // Price/ Kg	
                        items += '<td>'
                        items += value.price_kg;
                        items += '</td>'

                        // Amount
                        items += '<td>'
                        items += value.total_amount;
                        items += '</td>'

                        items += '<td>'
                        items +=
                            '<button type="button" class="btn btn-danger remove_item" data-id="' +
                            value.id + '"><i class="fa fa-trash"></i></button>'
                        items += '</td>'

                        items += '</tr>';
                    });
                    $('#ingredientLists').html(items);
                }
            });
        }

        getIngredientLists();

        // RemoveItem
        $(document).on("click", ".remove_item", function() {
            var id = $(this).data('id');
            $.ajax({
                url: `/remove_ingredient_list/${id}`,
                method: "GET",
                success: function(data) {
                    getIngredientLists();
                }
            });
        });
    </script>
@endsection
