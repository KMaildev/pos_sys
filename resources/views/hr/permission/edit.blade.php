@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">Permission</h5>
                <div class="card-body">

                    <form action="{{ route('permission.update', $permission->id) }}" method="POST" autocomplete="off"
                        id="edit-form" role="form">
                        @csrf
                        @method('PUT')
                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Name</label>
                            <div class="col-md-9">
                                <input class="form-control @error('name') is-invalid @enderror" type="text"
                                    name="name" value="{{ $permission->name }}" />
                                @error('name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Status
                            </label>
                            <div class="col-md-9">
                                <select name="status" id="" class="form-control" required>
                                    <option value="">
                                        -- Select --
                                    </option>
                                    <option value="module" @if ($permission->status == 'module') selected @endif>
                                        Module
                                    </option>
                                    <option value="function" @if ($permission->status == 'function') selected @endif>
                                        Function
                                    </option>
                                </select>
                                @error('status')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-search-input" class="col-md-3 col-form-label"></label>
                            <div class="col-md-9">
                                <button type="submit" class="btn btn-secondary">Save</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\UpdatePermission', '#edit-form') !!}
@endsection
@endsection
