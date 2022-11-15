<div class="col-md-12 col-lg-12 col-sm-12 py-3">
    <style>
        .table_btn {
            font-size: 24px;
            width: 100%;
            padding: 20px 32px;
            background-color: #2a66a3;
            margin: 10px;
            color: white;
        }
    </style>
    @foreach ($floors as $floor)
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <h2 class="card-title" style="font-size: 25px;">
                    {{ $floor->title ?? '' }}
                </h2>
            </div>
            @foreach ($floor->table_lists_table as $table_list)
                <div class="col-md-2 col-lg-2 col-sm-2">
                    <button class="table_btn" onclick="setTableName({{ $table_list->id }}, '{{ $table_list->table_name }}')">
                        {{ $table_list->table_name ?? '' }}
                    </button>
                </div>
            @endforeach
        </div>
        <hr>
    @endforeach
</div>
