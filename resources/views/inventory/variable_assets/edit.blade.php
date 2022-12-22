@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Variable Inventory Edit
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('variable_asset.update', $fixed_asset->id) }}"
                        method="POST" autocomplete="off" id="create-form" role="form">
                        @csrf
                        @method('PUT')

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Inventory Code
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('inventory_code') is-invalid @enderror" type="text"
                                    name="inventory_code" value="{{ $fixed_asset->inventory_code ?? '' }}" />
                                @error('inventory_code')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Description
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('description') is-invalid @enderror" type="text"
                                    name="description" value="{{ $fixed_asset->description ?? '' }}" />
                                @error('description')
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
                                    name="unit" value="{{ $fixed_asset->unit ?? '' }}" />
                                @error('unit')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Store
                            </label>
                            <div class="col-md-9">
                                <select name="store_id" class="form-control">
                                    <option value="">
                                        Please Select Store
                                    </option>
                                    @foreach ($stores as $store)
                                        <option value="{{ $store->id }}"
                                            @if ($fixed_asset->store_id == $store->id) selected @endif>
                                            {{ $store->name ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('store_id')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <div>
                                    <button type="submit" class="btn btn-primary w-md">
                                        Save
                                    </button>

                                    <a href="{{ route('variable_asset.index') }}" class="btn btn-success w-md">
                                        Back
                                    </a>
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
    {!! JsValidator::formRequest('App\Http\Requests\UpdateVariableAssets', '#create-form') !!}
@endsection
