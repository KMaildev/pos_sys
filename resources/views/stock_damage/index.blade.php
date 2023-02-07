@extends('layouts.main')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0 font-size-18">
                    Damage
                </h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}">
                                Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Damage
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
                        <div class="col-sm-12">
                            <div class="text-sm-end">
                                <a href="{{ route('stock_damage.create') }}"
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
                                    <th class="text-center" style="width: 1%;">
                                        #
                                    </th>

                                    <th class="text-center">
                                        Item Code
                                    </th>

                                    <th class="text-center">
                                        Item Name
                                    </th>

                                    <th class="text-center">
                                        Date
                                    </th>

                                    <th class="text-center">
                                        Unit
                                    </th>

                                    <th class="text-center">
                                        Damage Unit
                                    </th>

                                    <th class="text-center">
                                        Cause of damage
                                    </th>

                                    <th class="text-center">
                                        Damage Location
                                    </th>

                                    <th class="text-center">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($damages as $key => $stock_opening)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->ingredient_table->item_code ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->ingredient_table->name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->ingredient_table->unit ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->damage_date ?? '' }}
                                        </td>


                                        <td class="text-center">
                                            {{ number_format($stock_opening->damage_unit, 2) }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->cause_of_damage ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ $stock_opening->store_table->name ?? '' }}
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
                                                        <a href="{{ route('stock_damage_media_file', $stock_opening->id) }}"
                                                            class="dropdown-item">
                                                            <i class="mdi mdi-pencil font-size-16 text-success me-1"></i>
                                                            Media Files
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="{{ route('stock_damage.edit', $stock_opening->id) }}"
                                                            class="dropdown-item">
                                                            <i class="mdi mdi-pencil font-size-16 text-success me-1"></i>
                                                            Edit
                                                        </a>
                                                    </li>

                                                    <li>

                                                        <form
                                                            action="{{ route('stock_damage.destroy', $stock_opening->id) }}"
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
