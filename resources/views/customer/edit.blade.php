@extends('layouts.main')
@section('content')
    <div class="row justify-content-center">
        <div class="col-xl-12">
            <div class="card mb-4">
                <h5 class="card-header">Customer</h5>
                <div class="card-body">

                    <form action="{{ route('customer.update', $customer->id) }}" method="POST" autocomplete="off"
                        id="create-form" role="form">
                        <h6 class="mb-b fw-normal">1. Account Details</h6>
                        <hr>
                        @csrf
                        @method('PUT')

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Name</label>
                            <div class="col-md-9">
                                <input class="form-control @error('name') is-invalid @enderror" type="text"
                                    name="name" value="{{ $customer->name ?? '' }}" />
                                @error('name')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Primary Number</label>
                            <div class="col-md-9">
                                <input class="form-control @error('primary_number') is-invalid @enderror" type="text"
                                    name="primary_number" value="{{ $customer->primary_number ?? '' }}" />
                                @error('primary_number')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Additional Number</label>
                            <div class="col-md-9">
                                <input class="form-control @error('additional_number') is-invalid @enderror" type="text"
                                    name="additional_number" value="{{ $customer->additional_number ?? '' }}" />
                                @error('additional_number')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Email</label>
                            <div class="col-md-9">
                                <input class="form-control @error('email') is-invalid @enderror" type="text"
                                    name="email" value="{{ $customer->email ?? '' }}" />
                                @error('email')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Address</label>
                            <div class="col-md-9">
                                <input class="form-control @error('address') is-invalid @enderror" type="text"
                                    name="address" value="{{ $customer->address ?? '' }}" />
                                @error('address')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Date of Birth
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('date_of_birth') is-invalid @enderror" type="text"
                                    name="date_of_birth" value="{{ $customer->date_of_birth ?? '' }}" />
                                @error('date_of_birth')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Join Date
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('join_date') is-invalid @enderror" type="text"
                                    name="join_date" value="{{ $customer->join_date ?? '' }}" />
                                @error('join_date')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">
                                Remark
                            </label>
                            <div class="col-md-9">
                                <input class="form-control @error('remark') is-invalid @enderror" type="text"
                                    name="remark" value="{{ $customer->remark ?? '' }}" />
                                @error('remark')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Gender</label>
                            <div class="col-md-9">
                                <select name="gender" class="form-control">
                                    <option value="male" @if ('male' == $customer->gender) selected @endif>Male</option>
                                    <option value="female" @if ('female' == $customer->gender) selected @endif>Female</option>
                                </select>
                                @error('gender')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-search-input" class="col-md-3 col-form-label"></label>
                            <div class="col-md-9">
                                <a href="{{ route('customer.index') }}" class="btn btn-success waves-effect waves-light">
                                    Back
                                </a>
                                <button type="submit" class="btn btn-primary waves-effect waves-light">Save</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\UpdateCustomer', '#create-form') !!}
@endsection
