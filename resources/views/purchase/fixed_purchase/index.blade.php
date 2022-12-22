@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Fixed Assets Purchase
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Fixed Assets Purchase
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
                            <form action="{{ route('fixed_purchase.index') }}" method="get" autocomplete="off">
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
                                <a href="{{ route('fixed_purchase.create') }}"
                                    class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="mdi mdi-plus me-1"></i>
                                    Create
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Inventory Code</th>
                                    <th class="text-center">Description</th>
                                    <th class="text-center">Unit</th>
                                    <th class="text-center">Store</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
