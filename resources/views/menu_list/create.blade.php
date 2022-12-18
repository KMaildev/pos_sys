@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Category
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('menu_list.store') }}" method="POST" autocomplete="off"
                        id="create-form" role="form">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Menu Name (Eng)
                            </label>
                            <div class="col-md-3">
                                <input class="form-control @error('menu_name') is-invalid @enderror" type="text"
                                    name="menu_name" value="{{ old('menu_name') }}" />
                                @error('menu_name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>

                            <label for="html5-text-input" class="col-md-3 col-form-label" style="text-align: right">
                                Menu Name (Myanmar)
                            </label>
                            <div class="col-md-3">
                                <input class="form-control @error('menu_name_mm') is-invalid @enderror" type="text"
                                    name="menu_name_mm" value="{{ old('menu_name_mm') }}" />
                                @error('menu_name_mm')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Price
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('price') is-invalid @enderror" type="text"
                                    name="price" value="{{ old('price') }}" />
                                @error('price')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Category
                            </label>
                            <div class="col-md-9">
                                <select name="categorie_id" class="form-control" required>
                                    <option value="">
                                        -- Select Category --
                                    </option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">
                                            {{ $category->type ?? '' }}
                                            @
                                            {{ $category->title ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('categorie_id')
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
    {!! JsValidator::formRequest('App\Http\Requests\StoreMenuList', '#create-form') !!}
@endsection
