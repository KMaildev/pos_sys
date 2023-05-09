<div class="col-md-12 col-lg-12 col-sm-12">
    <div class="card-body overflow-auto" style="background-color: white;">
        <table class="table">
            <thead class="table-light">
                <tr>
                    <th class="text-center" style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Table
                    </th>
                    <th class="text-center" style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Items
                    </th>
                    <th class="text-center" style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Qty
                    </th>
                    <th class="text-center"
                        style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Price
                    </th>
                    <th class="text-center"
                        style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Date & Time
                    </th>
                    <th class="text-center"
                        style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Reason
                    </th>
                    <th class="text-center"
                        style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Void By
                    </th>
                    <th class="text-center"
                        style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Status
                    </th>
                    <th class="text-center"
                        style="font-size: 18px; background-color: #DBAF00; color: white; width: 10%">
                        Action
                    </th>
                </tr>
            </thead>
            <tbody style="background-color: white;">
                <tr>
                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['table_name'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['menu_name'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['qty'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['price'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['void_date'] }}
                        {{ $data['void_time'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['reason'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        {{ $data['void_by_table'] }}
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        @if ($data['manager_status'] == 'nothing')
                            <span class="badge bg-danger">Pending</span>
                        @endif

                        @if ($data['manager_status'] == 'reject')
                            <span class="badge bg-primary">Reject</span>
                        @endif

                        @if ($data['manager_status'] == 'done')
                            <span class="badge bg-success">Done</span>
                        @endif
                    </td>

                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                        @if ($data['manager_status'] == 'nothing')

                            <a href="{{ route('manager_void_item_accept', ['id' => $data['id']]) }}"
                                style="background-color: #4CAF50; border: none; color: white;  padding: 10px 22px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;">
                                Accept
                            </a>

                            <a href="{{ route('manager_void_item_reject', ['id' => $data['id']]) }}"
                                style="background-color: #f13c3c; border: none; color: white;  padding: 10px 22px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px 2px;cursor: pointer;">
                                Reject
                            </a>
                        @endif
                    </td>

                </tr>
            </tbody>
        </table>
    </div>
</div>
