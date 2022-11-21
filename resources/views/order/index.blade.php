@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Order list
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Order list
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
                            <div class="search-box me-2 mb-2 d-inline-block">
                                <div class="position-relative">
                                    <input type="text" class="form-control" placeholder="Search Table"
                                        id="searchOrderList">
                                    <i class="bx bx-search-alt search-icon"></i>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-8">
                            <div class="text-sm-end">
                                <button onclick="getOrderLists()" class="btn btn-primary aves-effect waves-light mb-2 me-2">
                                    <i class="fa fa-history"></i>
                                    Update
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table border-no mydatatable">
                            <thead class="table-light">
                                <tr class="tablebg">
                                    <th class="text-center" style="width: 1%;">#</th>
                                    <th class="text-center">Invoice</th>
                                    <th class="text-center">Order No</th>
                                    <th class="text-center">Order Date & Time</th>
                                    <th class="text-center">Table</th>
                                    <th class="text-center">Waiter</th>
                                    <th class="text-center">Total Amount</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="orderList">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
