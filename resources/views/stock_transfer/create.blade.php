@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Stock Transfer
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('stock_transfer.store') }}" method="POST" autocomplete="off"
                        id="create-form" role="form">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Item Code
                            </label>
                            <div class="col-md-9">
                                <select class="form-control select2" name="ingredient_id" id="ingredientId">
                                    <option value="">
                                        -- Please Select --
                                    </option>
                                    @foreach ($ingredients as $ingredient)
                                        <option value="{{ $ingredient->id }}">
                                            {{ $ingredient->item_code ?? $ingredient->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('ingredient_id')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Item Name
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="ItemName" readonly />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Unit
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="Unit" readonly />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Date
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('transfer_date') is-invalid @enderror" type="text"
                                    name="transfer_date" value="{{ old('transfer_date') }}" />
                                @error('transfer_date')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Transfer Unit
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('transfer_unit') is-invalid @enderror" type="text"
                                    name="transfer_unit" value="{{ old('transfer_unit') }}" />
                                @error('transfer_unit')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Location From
                            </label>
                            <div class="col-md-9">
                                <select class="form-control select2" name="location_from_store_id">
                                    <option value="">
                                        --Select Location From--
                                    </option>
                                    @foreach ($stores as $store)
                                        <option value="{{ $store->id }}">
                                            {{ $store->name ?? '' }}
                                            @
                                            {{ $store->code_name ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                To Location
                            </label>
                            <div class="col-md-9">
                                <select class="form-control select2" name="to_location_store_id">
                                    <option value="">
                                        --Select To Location--
                                    </option>
                                    @foreach ($stores as $store)
                                        <option value="{{ $store->id }}">
                                            {{ $store->name ?? '' }}
                                            @
                                            {{ $store->code_name ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <div>
                                    <a href="{{ route('stock_transfer.index') }}" class="btn btn-success w-md">
                                        Back
                                    </a>
                                    <button type="submit" class="btn btn-primary w-md">
                                        Save
                                    </button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\StoreStockTransfer', '#create-form') !!}
    <script>
        $('select[id="ingredientId"]').on('change', function() {
            var ingredientId = $(this).val();
            if (ingredientId) {
                $.ajax({
                    url: `/ingredients_by_id/${ingredientId}`,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        ItemName.value = data.name
                        Unit.value = data.unit
                    }
                });
            }
        });
    </script>
@endsection
