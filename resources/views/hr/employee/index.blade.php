@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Employee
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Employee
                        </li>
                    </ol>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-2">
                        <div class="col-sm-4">
                            <form action="{{ route('employee.index') }}" method="get">
                                <div class="search-box me-2 mb-2 d-inline-block">
                                    <div class="position-relative">
                                        <input type="text" class="form-control" placeholder="Search..." name="q">
                                        <i class="bx bx-search-alt search-icon"></i>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-8">
                            <div class="text-sm-end">
                                @include('layouts.includes.excel')
                                <a href="{{ route('employee.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table border-no mydatatable" id="tableId">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Photo</th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Phone</th>
                                    <th class="text-center">Department</th>
                                    <th class="text-center">Role</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($employees as $key => $value)
                                    <tr class="hover-primary">
                                        <td style="text-align: center;">
                                            {{ $key + 1 }}
                                        </td>

                                        <td>
                                            @if ($value->passport_photo)
                                                <img src="{{ Storage::url($value->passport_photo) }}" alt=""
                                                    style="width: 30px; height: 30px; background-position: center; background-size: contain, cover;">
                                            @endif
                                        </td>

                                        <td style="text-align: center;">
                                            {{ $value->employee_id }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ $value->name }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ $value->email }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ $value->phone }}
                                        </td>


                                        <td style="text-align: center;">
                                            {{ $value->department->title ?? '' }}
                                        </td>

                                        <td>
                                            Role
                                        </td>

                                        <td style="text-align: center;">
                                            <div class="btn-group">
                                                <a class="hover-primary dropdown-toggle no-caret" data-bs-toggle="dropdown">
                                                    <i class="fa fa-ellipsis-h"></i>
                                                </a>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item"
                                                        href="{{ route('employee.edit', $value->id) }}">
                                                        Edit
                                                    </a>

                                                    <a class="dropdown-item" href="{{ route('show_pin', $value->id) }}">
                                                        PIN
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
