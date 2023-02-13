@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Ingredient
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('ingredients.store') }}" method="POST" autocomplete="off"
                        id="create-form" role="form">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Item Code
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('item_code') is-invalid @enderror" type="text"
                                    name="item_code" value="{{ old('item_code') }}" />
                                @error('item_code')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Item Name
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('name') is-invalid @enderror" type="text"
                                    name="name" value="{{ old('name') }}" />
                                @error('name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Category
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('category') is-invalid @enderror" type="text"
                                    name="category" value="{{ old('category') }}" list="categories" />
                                <datalist id="categories">
                                    <option value="Juice">
                                    <option value="Beverage">
                                    <option value="Raw">
                                    <option value="Vegetable">
                                    <option value="Fruit">
                                </datalist>
                                @error('category')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Unit
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('unit') is-invalid @enderror" type="text"
                                    name="unit" value="{{ old('unit') }}" />
                                @error('unit')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <div>
                                    <a href="{{ route('ingredients.index') }}" class="btn btn-success w-md">
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
    {!! JsValidator::formRequest('App\Http\Requests\StoreIngredients', '#create-form') !!}
@endsection
