<template>
    <master :user_name="user_name" :login_time="login_time">
        <div class="row">
            <div class="col-xl-3 col-md-3 col-lg-3" style="height: 300px;" v-for="order_info in order_infos"
                :key="order_info.id">
                <div class="card-header d-flex">
                    <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 12px; text-align: left;">
                        TBL : {{ order_info.table_lists_table.table_name }}
                    </h4>

                    <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 12px; text-align: left;">
                        <i class="fa fa-clock"></i> {{ order_info.order_time }}
                    </h4>

                    <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 12px; text-align: right;">
                        GUEST : {{ order_info.guest_no }}
                    </h4>
                </div>

                <div class="card-body overflow-auto" style="height: 200px; background-color: white;">
                    <table class="table">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 40%; font-size: 18px;">
                                    Items
                                </th>
                                <th class="text-center" style="width: 25%; font-size: 18px;">
                                    Qty
                                </th>
                                <th class="text-center" style="width: 20%; font-size: 18px;">
                                    Price
                                </th>
                                <th class="text-right" style="width: 20%; font-size: 18px;">
                                    Total
                                </th>
                            </tr>
                        </thead>

                        <tbody style="background-color: white;">
                            <tr v-for="order_item in order_info.order_items_table" :key="order_item.id">
                                <td>
                                    {{ order_item.menu_name }}
                                    <br>
                                    {{ order_item.remark }}
                                </td>

                                <td class="text-center">
                                    {{ order_item.qty }}
                                </td>

                                <td class="text-center">
                                    {{ order_item.price }}
                                </td>

                                <td class="text-right">
                                    {{ order_item.qty * order_item.price }}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="card-header d-flex">
                    <h4 class="card-title mb-0 flex-grow-1 guest_title"
                        style="font-size: 12px; font-weight: bold; text-align: left;">
                        <i class="fa fa-user"></i> {{ order_info.waiter_user_table.name }}
                    </h4>

                    <h4 class="card-title mb-0 flex-grow-1 guest_title"
                        style="font-size: 12px; font-weight: bold; text-align: right;">
                        Total : {{ totalAmountCalc(order_info.order_items_table) }}
                    </h4>
                </div>
            </div>
        </div>
    </master>
</template>
<script>

import Master from "../Layout/Master";

export default {
    name: "Index",
    components: {
        Master
    },

    data() {
        return {
            q: '',
        }
    },

    props: [
        'user_name',
        'login_time',
        'order_infos',
    ],

    methods: {
        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },
    }
}
</script>