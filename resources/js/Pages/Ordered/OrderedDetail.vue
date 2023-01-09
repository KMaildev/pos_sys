<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <MenuButton :order_infos="order_infos"></MenuButton>
                </div>
            </div>

            <div class="ScrollStyle">
                <div class="row py-2">

                    <div class="col-xl-4 col-md-4 col-lg-4">
                        <div class="card-header d-flex">
                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; text-align: left;">
                                TBL : {{ order_infos.table_lists_table.table_name }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; text-align: left;">
                                <i class="fa fa-clock"></i> {{ order_infos.order_time }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; text-align: right;">
                                GUEST : {{ order_infos.guest_no }}
                            </h4>
                        </div>

                        <div class="card-body overflow-auto" style="background-color: white;">
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
                                    <tr v-for="order_item in order_infos.order_items_table" :key="order_item.id">
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
                                style="font-size: 13px; font-weight: bold; text-align: left;">
                                <i class="fa fa-user"></i> {{ order_infos.waiter_user_table.name }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; font-weight: bold; text-align: right;">
                                Total : {{ totalAmountCalc(order_infos.order_items_table) }}
                            </h4>
                        </div>

                        <button class="additional_order"
                            @click="setTableName(order_infos.table_list_id, order_infos.table_lists_table.table_name, order_infos.guest_no)">
                            Additional Order
                        </button>
                    </div>

                </div>
            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import MenuButton from "./MenuButton.vue";

export default {
    name: "OrderedDetail",
    components: {
        Master,
        MenuButton,
    },

    data() {
        return {

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


        setTableName(table_id, table_name, guest_no) {
            if (table_id && table_name) {
                let type = 'Beverage';
                localStorage.setItem("table_id", table_id);
                localStorage.setItem("table_name", table_name);
                localStorage.setItem("guest_no", guest_no);
                this.$inertia.get(`/pos_menu?type=${type}`);
            } else {
                this.alertMessage();
            }
        },
    }
};
</script>
<style>

</style>