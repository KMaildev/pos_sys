@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Taxrate Edit
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('taxrate.update', $store->id) }}" method="POST"
                        autocomplete="off" id="create-form" role="form">
                        @csrf
                        @method('PUT')

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Name
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('name') is-invalid @enderror" type="text"
                                    name="name" value="{{ $store->name ?? '' }}" />
                                @error('name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Taxrate
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('taxrate') is-invalid @enderror" type="text"
                                    name="taxrate" value="{{ $store->taxrate ?? '' }}" />
                                @error('taxrate')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Status
                            </label>
                            <div class="col-md-9">
                                <select name="status" class="form-control">
                                    <option value="Active" @if ('Active' == $store->status) selected @endif>Active</option>
                                    <option value="Inactive" @if ('Inactive' == $store->status) selected @endif>Inactive
                                    </option>
                                </select>
                                @error('status')
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

                                    <a href="{{ route('taxrate.index') }}" class="btn btn-success w-md">
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
    {!! JsValidator::formRequest('App\Http\Requests\UpdateStore', '#create-form') !!}
@endsection
