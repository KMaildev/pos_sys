@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Damage
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('stock_damage.update', $stock_transfer->id) }}"
                        method="POST" autocomplete="off" id="create-form" role="form">
                        @csrf
                        @method('PUT')

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
                                        <option value="{{ $ingredient->id }}"
                                            @if ($ingredient->id == $stock_transfer->ingredient_id) selected @endif>
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
                                <input class="form-control @error('damage_date') is-invalid @enderror" type="text"
                                    name="damage_date" value="{{ $stock_transfer->damage_date ?? '' }}" />
                                @error('damage_date')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Damage Unit
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('damage_unit') is-invalid @enderror" type="text"
                                    name="damage_unit" value="{{ $stock_transfer->damage_unit ?? '' }}" />
                                @error('damage_unit')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Cause of damage
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('cause_of_damage') is-invalid @enderror" type="text"
                                    name="cause_of_damage" value="{{ $stock_transfer->cause_of_damage ?? '' }}" />
                                @error('cause_of_damage')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Damage Location
                            </label>
                            <div class="col-md-9">
                                <select class="form-control select2" name="store_id">
                                    <option value="">
                                        --Select Damage Location--
                                    </option>
                                    @foreach ($stores as $store)
                                        <option value="{{ $store->id }}"
                                            @if ($store->id == $stock_transfer->store_id) selected @endif>
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
                                    <a href="{{ route('stock_damage.index') }}" class="btn btn-success w-md">
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
    {!! JsValidator::formRequest('App\Http\Requests\UpdateDamage', '#create-form') !!}
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

        function autoAjaxCall() {
            var ingredientId = '{{ $stock_transfer->ingredient_id }}';
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
        }
        autoAjaxCall();
    </script>
@endsection
