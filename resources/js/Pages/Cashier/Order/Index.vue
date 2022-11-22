<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>

            <div class="container-fluid">
                <div class="row py-4">
                    <div class="col-md-8">
                        <OrderList :order_infos="order_infos"></OrderList>
                    </div>

                    <div class="col-md-4">
                        <div class="receipt" style="background-color: white; width: 100%;">
                            <div class="mybill">
                                <div class="brand" style="font-size: 16px;">
                                    LV Restaurant
                                </div>
                                <div class="address" style="font-size: 16px;">
                                    FLoor 2 Building No 34 Myanmar
                                    <br> Phone No- 0192083910
                                </div>
                            </div>
                            <br>
                            <div class="flex justify-between">
                                <div style="font-size: 16px;">
                                    Invoice:
                                    {{ inv_no ?? '-' }}
                                </div>
                                <div style="font-size: 16px;">
                                    Order No:
                                    {{ order_no ?? '-' }}
                                </div>
                            </div>
                            <div class="flex justify-between">
                                <div style="font-size: 16px;">
                                    Date:
                                    {{ order_date_time ?? '-' }}
                                </div>
                                <div style="font-size: 16px;">
                                    Table:
                                    {{ table_name ?? '-' }}
                                </div>
                            </div>

                            <div class="flex justify-between">
                                <div style="font-size: 16px;">
                                    Guest:
                                    {{ guest_no ?? '-' }}
                                </div>
                            </div>
                            <br>
                            <table class="table" style="width: 100%">
                                <tr class="header">
                                    <th style="font-size: 16px; width: 50px;">
                                        Description
                                    </th>
                                    <th style="font-size: 16px; width: 20%; text-align: right;">
                                        Qty
                                    </th>
                                    <th style="font-size: 16px; width: 20%; text-align: right;">
                                        Price
                                    </th>
                                    <th style="font-size: 16px; width: 20%; text-align: right;">
                                        Amount
                                    </th>
                                </tr>

                                <tr v-for="order_item in order_items" :key="order_item.id">

                                    <td style="width: 250px; padding: 3px;">
                                        {{ order_item.menu_lists_table.menu_name }}
                                    </td>

                                    <td style="width: 20%; padding: 3px; text-align: right;">
                                        {{ order_item.qty }}
                                    </td>

                                    <td style="width: 20%; padding: 3px; text-align: right;">
                                        {{ order_item.price }}
                                    </td>

                                    <td style="width: 20%; padding: 3px; text-align: right;">
                                        {{ amountCalc(order_item) }}
                                    </td>

                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </CashierMaster>
    </div>
</template>
<script>

import CashierMaster from "../../Layout/CashierMaster.vue";
import TopLink from "../Shared/TopLink.vue";
import OrderList from "./OrderList.vue";

export default {
    components: {
        CashierMaster,
        TopLink,
        OrderList,
    },
    name: "Index",

    props: [
        'user_name',
        'login_time',
        'order_infos',

        'show_order_info',
        'inv_no',
        'order_no',
        'order_date_time',
        'table_name',
        'guest_no',

        'order_items',
    ],

    methods: {
        amountCalc(order_item) {
            return order_item.price * order_item.qty;
        },
    }
}
</script>
<style>

</style>