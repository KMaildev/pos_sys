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
                                        <button type="button" class="btn btn-primary" onclick="setPurchaseInvoiceCart()">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
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
                        console.log(data);
                        Unit.value = data.unit;
                    }
                });
            }
        });
    </script>
@endsection
