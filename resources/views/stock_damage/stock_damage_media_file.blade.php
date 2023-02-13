@extends('layouts.main')
@section('content')
    <h4 class="py-3 breadcrumb-wrapper mb-4">
        <span class="text-muted fw-light">Damage /</span>
        {{ $damage->ingredient_table->item_code ?? '' }}
        /
        {{ $damage->ingredient_table->name ?? '' }}
    </h4>
    <div class="card">
        <br>
        <form enctype="multipart/form-data" style="margin: 10px" action="{{ route('damage_files_upload') }}" method="post"
            autocomplete="off">
            @csrf
            <div class="input-group">
                <input type="hidden" name="damage_id" value="{{ $damage->id }}" required>
                <input class="form-control @error('damage_files') is-invalid @enderror" type="file" name="damage_files[]"
                    multiple />
                @error('damage_files')
                    <div class="invalid-feedback"> {{ $message }} </div>
                @enderror
                <input type="submit" class="dt-button create-new btn btn-primary" value="Upload">
            </div>
            <a href="{{ route('stock_damage.index') }}" class="btn btn-success w-md">
                Back
            </a>
        </form>

        <h5 class="card-header">Files</h5>
        <div class="table-responsive text-nowrap">
            <table class="table table-bordered">
                <thead class="tbbg">
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center" style="width: 20px;">File Name</th>
                        <th class="text-center">Download</th>
                        <th class="text-center">Upload Date</th>
                        <th class="text-center">Upload By</th>
                    </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                    @foreach ($damage_files as $key => $value)
                        <tr>
                            <td>
                                {{ $loop->iteration }}
                            </td>

                            <td style="width: 100px;">
                                <img src="{{ Storage::url($value->files) }}" alt=""
                                    style="width: 90px; height: 90px; background-position: center; background-size: contain, cover;">
                            </td>

                            <td>
                                <a href="{{ Storage::url($value->files) }}" download="{{ $value->original_name }}">
                                    <i class="fa fa-download fa-lg text-danger"></i>
                                    <strong>Download</strong>
                                </a>
                            </td>

                            <td>
                                <i class="fa fa-calendar fa-lg text-success"></i>
                                <strong>{{ $value->created_at }}</strong>
                            </td>
                            <td>
                                <i class="fa fa-user fa-lg text-success"></i>
                                <strong>{{ $value->users_table->name ?? '' }}</strong>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
