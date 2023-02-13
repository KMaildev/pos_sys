@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Table
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('table_list.update', $table_list->id) }}" method="POST"
                        autocomplete="off" id="create-form" role="form">
                        @csrf
                        @method('PUT')

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Table Name
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('table_name') is-invalid @enderror" type="text"
                                    name="table_name" value="{{ $table_list->table_name ?? '' }}" />
                                @error('table_name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Floor
                            </label>
                            <div class="col-md-9">
                                <select name="floor_id" class="form-control" required>
                                    <option value="">
                                        -- Select Floor --
                                    </option>
                                    @foreach ($floors as $floor)
                                        <option value="{{ $floor->id }}"
                                            @if ($table_list->floor_id == $floor->id) selected @endif>
                                            {{ $floor->title ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('floor_id')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="row justify-content-end">
                            <div class="col-sm-9">
                                <div>
                                    <a href="{{ route('table_list.index') }}" class="btn btn-success w-md">
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
    {!! JsValidator::formRequest('App\Http\Requests\StoreTableList', '#create-form') !!}
@endsection
