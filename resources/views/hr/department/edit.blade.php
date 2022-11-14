@extends('layouts.main')
@section('content')
<div class="row justify-content-center">
    <div class="col-xl-12">
        <div class="card mb-4">
            <h5 class="card-header">Department</h5>
            <div class="card-body">
                <form class="row gx-3 gy-2 align-items-center" action="{{ route('department.update', $department->id) }}" method="POST"
                    autocomplete="off" id="create-form" role="form">
                    @csrf
                    @method('PUT')
                    <div class="hstack gap-3">
                        <input class="form-control me-auto @error('title') is-invalid @enderror" type="text"
                            name="title" value="{{ $department->title }}"  />
                        @error('title')
                            <div class="invalid-feedback"> {{ $message }} </div>
                        @enderror
                        <button type="submit" class="btn btn-secondary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\UpdateDepartment', '#create-form') !!}
@endsection
