@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Payment Method
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Payment Method
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
                            <form action="{{ route('payment_method.index') }}" method="get" autocomplete="off">
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
                                <a href="{{ route('payment_method.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable" id="tableId">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Remark</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($stores as $key => $store)
                                    <tr>
                                        <td>
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $store->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $store->remark ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            @if ($store->status == 'Active')
                                                <span class="badge bg-success">
                                                    {{ $store->status }}
                                                </span>
                                            @else
                                                <span class="badge bg-danger">
                                                    {{ $store->status }}
                                                </span>
                                            @endif
                                        </td>

                                        <td class="text-center">
                                            <div class="dropdown">
                                                <a href="#"
                                                    class="dropdown-toggle card-drop btn btn-sm btn-primary text-white"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    Action
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end" style="">
                                                    <li>
                                                        <a href="{{ route('payment_method.edit', $store->id) }}"
                                                            class="dropdown-item">
                                                            <i class="mdi mdi-pencil font-size-16 text-success me-1"></i>
                                                            Edit
                                                        </a>
                                                    </li>

                                                    <li hidden>
                                                        <form action="{{ route('payment_method.destroy', $store->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="dropdown-item del_confirm"
                                                                id="confirm-text">
                                                                <i
                                                                    class="mdi mdi-trash-can font-size-16 text-danger me-1"></i>
                                                                Delete
                                                            </button>
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
