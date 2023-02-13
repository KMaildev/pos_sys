@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <div class="row mb-2">
                        <div class="col-sm-4">
                            <form action="{{ route('permission.index') }}" method="get">
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
                                <a href="{{ route('permission.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="tableId">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center" style="width: 5%;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($permission as $key => $value)
                                    <tr>

                                        <td class="text-center">
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $value->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $value->status ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            <div class="list-icons d-inline-flex">
                                                <div class="list-icons-item dropdown">
                                                    <a href="#" class="list-icons-item dropdown-toggle"
                                                        data-bs-toggle="dropdown">
                                                        <i class="fa fa-gear"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-end">

                                                        <a href="{{ route('permission.edit', $value->id) }}"
                                                            class="dropdown-item">
                                                            <i class="fa fa-edit"></i>
                                                            Edit Data
                                                        </a>

                                                        <form action="{{ route('permission.destroy', $value->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="button" class="dropdown-item del_confirm"
                                                                id="confirm-text" data-toggle="tooltip">Delete</button>
                                                        </form>

                                                    </div>
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
