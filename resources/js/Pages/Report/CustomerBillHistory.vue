<template>
    <div>
        <master :user_name="user_name">
            <div class="row py-2">
                <MenuButton></MenuButton>
            </div>

            <div class="row">
                <ManagementButton></ManagementButton>
            </div>

            <div class="row py-3">
                <div class="col-md-12">
                    <h6 style="color: white;">
                        Bill History /
                        {{ customer.name }}
                        /
                        {{ customer.primary_number }}
                    </h6>
                </div>

                <div class="col-xl-3 col-md-3 col-lg-3" style="height: 300px;" v-for="bill_info in bill_infos"
                    :key="bill_info.id">
                    <div @click="billHistory(bill_info.order_infos_table.id)">
                        <div class="card-header d-flex">
                            <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 11px; text-align: left;">
                                TBL : {{ bill_info.table_lists_table.table_name }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 11px; text-align: left;">
                                <i class="fa fa-clock"></i>
                                {{ bill_info.bill_time }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 11px; text-align: right;">
                                GUEST : {{ bill_info.order_infos_table.guest_no }}
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
                                    <tr v-for="order_item in bill_info.order_items_table" :key="order_item.id">
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
                                <i class="fa fa-user"></i> {{ bill_info.waiter_user_table.name }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 12px; font-weight: bold; text-align: right;">
                                Total : {{ totalAmountCalc(bill_info.order_items_table) }}
                            </h4>
                        </div>

                    </div>
                </div>
            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import MenuButton from "./components/MenuButton.vue";
import ManagementButton from "./components/ManagementButton.vue";

export default {
    name: "CustomerBillHistory",
    components: {
        Master,
        MenuButton,
        ManagementButton
    },

    props: [
        'user_name',
        'login_time',
        'bill_infos',
        'customer',
    ],


    methods: {
        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        billHistory(id){
            this.$inertia.get(`/bill_history/${id}`);
        },
    }
};
</script>
<style>
.billInput {
    width: 100%;
    border: none;
}
</style>