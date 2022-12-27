@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">
                    Variable Assets Damage
                </h5>

                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('variable_damage.store') }}" method="POST"
                        autocomplete="off" id="create-form" role="form" enctype="multipart/form-data">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Variable Assets
                            </label>
                            <div class="col-md-9">
                                <select name="variable_asset_id" class="form-control select2">
                                    @foreach ($variable_assets as $variable_asset)
                                        <option value="{{ $variable_asset->id }}">
                                            {{ $variable_asset->inventory_code ?? '' }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('variable_asset_id')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Damage
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('damage_qty') is-invalid @enderror" type="text"
                                    name="damage_qty" value="{{ old('damage_qty') }}" />
                                @error('damage_qty')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Cause of Incident
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('causes_of_accidents') is-invalid @enderror"
                                    type="text" name="causes_of_accidents" value="{{ old('causes_of_accidents') }}" />
                                @error('causes_of_accidents')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Proof Photo
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('proof_photo') is-invalid @enderror" type="file"
                                    name="proof_photo[]" value="{{ old('proof_photo') }}" multiple />
                                @error('proof_photo')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Compensation
                            </label>
                            <div class="col-md-9">
                                <select name="compensation" class="form-control">
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                    <option value="Other">Other</option>
                                </select>
                                @error('compensation')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Proof Voucher Attach
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('voucher_attach') is-invalid @enderror" type="file"
                                    name="voucher_attach" value="{{ old('voucher_attach') }}" />
                                @error('voucher_attach')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Remark
                            </label>
                            <div class="col-md-9">
                                <textarea class="form-control @error('remark') is-invalid @enderror" rows="3" name="remark">{{ old('remark') }}</textarea>
                                @error('remark')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Date
                            </label>
                            <div class="col-md-9">
                                <input class="form-control date_picker @error('damage_date') is-invalid @enderror"
                                    type="text" name="damage_date" value="{{ old('damage_date') }}" />
                                @error('damage_date')
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

                                    <a href="{{ route('variable_damage.index') }}" class="btn btn-success w-md">
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
    {!! JsValidator::formRequest('App\Http\Requests\StoreVariableDamage', '#create-form') !!}
@endsection
