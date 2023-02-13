@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Store
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('store.store') }}" method="POST" autocomplete="off"
                        id="create-form" role="form">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Code Name
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('code_name') is-invalid @enderror" type="text"
                                    name="code_name" value="{{ old('code_name') }}" />
                                @error('code_name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Name
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
                                Store Types
                            </label>
                            <div class="col-md-9">
                                <select name="store_types" id=""
                                    class="form-control @error('store_types') is-invalid @enderror">
                                    <option value="">
                                        --Select Store Types--
                                    </option>
                                    @foreach ($store_types as $store_type)
                                        <option value="{{ $store_type->id ?? '' }}">
                                            {{ $store_type->title ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('store_types')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Location
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('address') is-invalid @enderror" type="text"
                                    name="address" value="{{ old('address') }}" />
                                @error('address')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <div>
                                    <a href="{{ route('store.index') }}" class="btn btn-success w-md">
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
    {!! JsValidator::formRequest('App\Http\Requests\StoreStore', '#create-form') !!}
@endsection
