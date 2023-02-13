@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12 col-md-12 col-sm-12 col-lg-12">
            <div class="card mb-4">
                <h5 class="card-header">Role</h5>
                <div class="card-body">

                    <form action="{{ route('role.update', $role->id) }}" method="POST" autocomplete="off" id="edit-form"
                        role="form">
                        @csrf
                        @method('PUT')
                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Name</label>
                            <div class="col-md-9">
                                <input class="form-control @error('name') is-invalid @enderror" type="text"
                                    name="name" value="{{ $role->name }}" />
                                @error('name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-9">
                            <div class="mb-3 row">
                                <small class="text-black fw-semibold d-block">
                                    Permission -> Moudle
                                </small>
                                @foreach ($permissions as $permission)
                                    @if ($permission->status == 'module')
                                        <div class="col-md-4 col-3">
                                            <div class="form-check form-check-primary mt-3">
                                                <input class="form-check-input" type="checkbox"
                                                    value="{{ $permission->name }}" id="checkbox_{{ $permission->id }}"
                                                    name="permissions[]" @if (in_array($permission->id, $old_permissions)) checked @endif />
                                                <label class="form-check-label"
                                                    for="checkbox_{{ $permission->id }}">{{ $permission->name }}</label>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            </div>

                            <div class="col-md-9">
                                <div class="mb-3 row">
                                    <small class="text-black fw-semibold d-block">
                                        Permission -> Function
                                    </small>
                                    @foreach ($permissions as $permission)
                                        @if ($permission->status == 'function')
                                            <div class="col-md-4 col-3">
                                                <div class="form-check form-check-primary mt-3">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="{{ $permission->name }}" id="checkbox_{{ $permission->id }}"
                                                        name="permissions[]" @if (in_array($permission->id, $old_permissions)) checked @endif />
                                                    <label class="form-check-label"
                                                        for="checkbox_{{ $permission->id }}">{{ $permission->name }}</label>
                                                </div>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-search-input" class="col-md-3 col-form-label"></label>
                            <div class="col-md-9">
                                <a href="{{ route('role.index') }}" class="btn btn-success w-md">
                                    Back
                                </a>
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
    {!! JsValidator::formRequest('App\Http\Requests\UpdateRole', '#edit-form') !!}
@endsection
@endsection
