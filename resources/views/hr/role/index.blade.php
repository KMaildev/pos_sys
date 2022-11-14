@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-2">
                        <div class="col-sm-4">
                            <form action="{{ route('role.index') }}" method="get">
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
                                <a href="{{ route('role.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center" style="width: 3%;">Name</th>
                                    <th class="text-center" style="width: 50%;">Permissions</th>
                                    <th class="text-center" style="width: 5%;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($roles as $key => $value)
                                    <tr>
                                        <td style="text-align: center;">
                                            {{ $key + 1 }}
                                        </td>
                                        <td style="text-align: center;">
                                            {{ $value->name }}
                                        </td>
                                        <td style="text-align: center;">
                                            @foreach ($value->permissions as $permission)
                                                <span class="badge bg-primary">{{ $permission->name }}</span>
                                            @endforeach
                                        </td>

                                        <td style="text-align: center;">
                                            <div class="btn-group">
                                                <button class="btn btn-primary btn-sm dropdown-toggle" type="button"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    Action
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a class="dropdown-item"
                                                            href="{{ route('role.edit', $value->id) }}">Edit</a>
                                                    </li>
                                                    <li>
                                                        <form action="{{ route('role.destroy', $value->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="button" class="dropdown-item del_confirm"
                                                                id="confirm-text" data-toggle="tooltip">Delete</button>
                                                        </form>
                                                    </li>
                                                </ul>
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
