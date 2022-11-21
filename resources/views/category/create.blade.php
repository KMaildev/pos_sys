@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Category
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('category.store') }}" method="POST" autocomplete="off"
                        id="create-form" role="form">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Title
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('title') is-invalid @enderror" type="text"
                                    name="title" value="{{ old('title') }}" />
                                @error('title')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Type
                            </label>
                            <div class="col-md-9">
                                <select name="type" class="form-control" required>
                                    <option value="">
                                        -- Select --
                                    </option>
                                    <option value="Food">
                                        Food
                                    </option>
                                    <option value="Bar">
                                        Bar
                                    </option>
                                    <option value="Beverage">
                                        Beverage
                                    </option>
                                </select>
                                @error('type')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Background Color
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('background_color') is-invalid @enderror" type="color"
                                    name="background_color" value="{{ old('background_color') }}" />
                                @error('background_color')
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
    {!! JsValidator::formRequest('App\Http\Requests\StoreCategory', '#create-form') !!}
@endsection
