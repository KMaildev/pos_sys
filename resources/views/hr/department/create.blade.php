@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">Department</h5>
                <div class="card-body">
                    <form class="row gx-3 gy-2 align-items-center" action="{{ route('department.store') }}" method="POST"
                        autocomplete="off" id="create-form" role="form">
                        @csrf
                        <div class="hstack gap-3">
                            <input class="form-control me-auto @error('title') is-invalid @enderror" type="text"
                                name="title" value="{{ old('title') }}" />
                            @error('title')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                            <button type="submit" class="btn btn-secondary">Submit</button>
                            <a href="{{ route('department.index') }}" class="btn btn-success w-md">
                                Back
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\StoreDepartment', '#create-form') !!}
@endsection
