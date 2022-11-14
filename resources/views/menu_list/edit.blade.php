@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Category
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('menu_list.update', $menu_list->id) }}" method="POST"
                        autocomplete="off" id="create-form" role="form">
                        @csrf
                        @method('PUT')

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Menu Name
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('menu_name') is-invalid @enderror" type="text"
                                    name="menu_name" value="{{ $menu_list->menu_name ?? '' }}" />
                                @error('menu_name')
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
                                    name="price" value="{{ $menu_list->price ?? 0 }}" />
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
                                        <option value="{{ $category->id }}"
                                            @if ($menu_list->categorie_id == $category->id) selected @endif>
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
