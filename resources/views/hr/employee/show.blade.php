@extends('layouts.main')
@section('content')
    <link rel="stylesheet" href="{{ asset('assets/vendor/css/pages/page-profile.css') }}" />
    <div class="row justify-content-center">
        <div class="col-md-8 col-sm-12 col-lg-8">
            <div class="row">
                <div class="col-12">
                    <div class="card mb-4">
                        <div class="user-profile-header-banner">
                            <img src="{{ asset('assets/img/pages/profile-banner.png') }}" alt="Banner image"
                                class="rounded-top">
                        </div>
                        <div class="user-profile-header d-flex flex-column flex-sm-row text-sm-start text-center mb-4">
                            <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                                @if ($employee->passport_photo)
                                    <img src="{{ Storage::url($employee->passport_photo) }}" alt=""
                                        class="d-block h-auto ms-0 ms-sm-4 rounded-3 user-profile-img">
                                @else
                                    <img src="{{ asset('assets/data/profile.png') }}" alt="user image"
                                        class="d-block h-auto ms-0 ms-sm-4 rounded-3 user-profile-img">
                                @endif
                            </div>
                            <div class="flex-grow-1 mt-3 mt-sm-5">
                                <div
                                    class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-4 flex-md-row flex-column gap-4">
                                    <div class="user-profile-info">
                                        <h4>{{ $employee->name }}</h4>
                                        <ul
                                            class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-2">
                                            <li class="list-inline-item fw-semibold">
                                                <i class='bx bx-pen'></i>
                                                {{ $employee->department ? $employee->department->title : '-' }}
                                            </li>
                                            <li class="list-inline-item fw-semibold">
                                                <i class='bx bx-calendar-alt'></i>
                                                Joined
                                                {{ $employee->created_at->diffForHumans() }}
                                            </li>
                                        </ul>
                                    </div>
                                    <a href="mailto:{{ $employee->email }}" class="btn btn-primary text-nowrap">
                                        <i class='bx bx-mail-send'></i> Send Mail
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills flex-column flex-sm-row mb-4">
                                <li class="nav-item">
                                    <a class="nav-link active" href="{{ route('employee.show', $employee->id) }}">
                                        <i class='bx bx-user'></i> Profile
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('members_lists.show', $employee->id) }}">
                                        <i class='bx bx-user'></i> Files
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('changepassword.index') }}">
                                        <i class='bx bx-user'></i> Change Password
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <!-- About User -->
                            <div class="card mb-4">
                                <div class="card-body">
                                    <small class="text-muted text-uppercase">About</small>
                                    <ul class="list-unstyled mb-4 mt-3">
                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-id-card"></i>
                                            <span class="fw-semibold mx-2">ID:</span>
                                            <span>{{ $employee->employee_id }}</span>
                                        </li>
                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-user"></i>
                                            <span class="fw-semibold mx-2">Name:</span>
                                            <span>{{ $employee->name }}</span>
                                        </li>
                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-id-card"></i>
                                            <span class="fw-semibold mx-2">NRC Number:</span>
                                            <span>{{ $employee->nrc_number ? $employee->nrc_number : '-' }}</span>
                                        </li>
                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-user-check"></i>
                                            <span class="fw-semibold mx-2">Gender:</span>
                                            <span>{{ ucfirst($employee->gender) }}</span>
                                        </li>
                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-map"></i>
                                            <span class="fw-semibold mx-2">Address:</span>
                                            <span>{{ $employee->address }}</span>
                                        </li>
                                    </ul>

                                    <small class="text-muted text-uppercase">Contacts</small>
                                    <ul class="list-unstyled mb-4 mt-3">

                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-phone"></i>
                                            <span class="fw-semibold mx-2">Contact:</span>
                                            <span>{{ $employee->phone }}</span>
                                        </li>

                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-envelope"></i>
                                            <span class="fw-semibold mx-2">
                                                Email:
                                            </span>
                                            <span>{{ $employee->email }}</span>
                                        </li>

                                    </ul>

                                    <small class="text-muted text-uppercase">Teams</small>
                                    <ul class="list-unstyled mt-3 mb-0">

                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-check-double"></i>
                                            <span class="fw-semibold mx-2">
                                                Department:
                                            </span>
                                            <span>
                                                {{ $employee->department ? $employee->department->title : '-' }}
                                            </span>
                                        </li>

                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-check-double"></i>
                                            <span class="fw-semibold mx-2">
                                                Role (or) Designation:
                                            </span>
                                            <span>
                                                @foreach ($employee->roles as $role)
                                                    <span>{{ $role->name }}</span>
                                                @endforeach
                                            </span>
                                        </li>
                                    </ul>

                                    <small class="text-muted text-uppercase">Emergency Contact</small>
                                    <ul class="list-unstyled mt-3 mb-0">

                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-check-double"></i>
                                            <span class="fw-semibold mx-2">
                                                Contact Person:
                                            </span>
                                            <span>
                                                {{ $employee->contact_person ?? '' }}
                                            </span>
                                        </li>

                                        <li class="d-flex align-items-center mb-3">
                                            <i class="bx bx-check-double"></i>
                                            <span class="fw-semibold mx-2">
                                                Role (or) Designation:
                                            </span>
                                            <span>
                                                {{ $employee->emergency_contact ?? '' }}
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--/ About User -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
