<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>

            <div class="container-fluid ScrollStyle1">
                <div class="row py-4">

                    <div class="col-md-4">
                        <form @submit.prevent="submitPayment">
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
                                        {{ show_order_info.inv_no ?? '-' }}
                                    </div>
                                    <div style="font-size: 16px;">
                                        Order No:
                                        {{ show_order_info.order_no ?? '-' }}
                                    </div>
                                </div>

                                <div class="flex justify-between">
                                    <div style="font-size: 16px;">
                                        Date:
                                        {{ show_order_info.order_date_time ?? '-' }}
                                    </div>
                                    <div style="font-size: 16px;">
                                        Table:
                                        {{ show_order_info.table_lists_table.table_name ?? '-' }}
                                    </div>
                                </div>

                                <div class="flex justify-between">

                                    <div style="font-size: 16px;">
                                        Customer:
                                        <input type="text" class="billInput" v-model="form.customer" readonly>
                                    </div>

                                    <div style="font-size: 16px;">
                                        Guest:
                                        {{ show_order_info.guest_no ?? '-' }}
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

                                    <br>
                                    <!-- Total  -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Total
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" :value="totalAmountCalc(order_items)" class="billInput"
                                                readonly>
                                        </td>
                                    </tr>

                                    <!-- Tax  -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Tax
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.tax">
                                        </td>
                                    </tr>

                                    <!-- Disc -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Disc
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.disc">
                                        </td>
                                    </tr>

                                    <!-- Services Charges -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Service Charges
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.service_charges">
                                        </td>
                                    </tr>

                                    <!-- Net Amount  -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Net Amount
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.net_amount">
                                        </td>
                                    </tr>

                                    <!-- Received -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Total Amount
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.received_amount">
                                        </td>
                                    </tr>

                                    <!-- payment_type -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Pay Type
                                        </td>
                                        <td style="text-align: center font-size: 16px;"></td>

                                        <td style="text-align: right;">
                                            <select class="form-control" v-model="form.payment_type">
                                                <option value="CashDown">CashDown</option>
                                                <option value="KPay">KPay</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>

                                <!-- d-flex justify-content-end -->
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-success btn-lg">
                                        <i class="fa fa-credit-card"></i>
                                        Preview
                                    </button>
                                </div>

                            </div>
                        </form>
                    </div>



                    <!-- Print Area  -->
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
                                    {{ show_order_info.inv_no ?? '-' }}
                                </div>
                                <div style="font-size: 16px;">
                                    Order No:
                                    {{ show_order_info.order_no ?? '-' }}
                                </div>
                            </div>

                            <div class="flex justify-between">
                                <div style="font-size: 16px;">
                                    Date:
                                    {{ show_order_info.order_date_time ?? '-' }}
                                </div>
                                <div style="font-size: 16px;">
                                    Table:
                                    {{ show_order_info.table_lists_table.table_name ?? '-' }}
                                </div>
                            </div>

                            <div class="flex justify-between">

                                <div style="font-size: 16px;">
                                    Customer:
                                    Mg Mg
                                </div>

                                <div style="font-size: 16px;">
                                    Guest:
                                    {{ show_order_info.guest_no ?? '-' }}
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

                                <br>
                                <!-- Total  -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Total
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ totalAmountCalc(order_items) }}
                                    </td>
                                </tr>

                                <!-- Tax  -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Tax
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ form.tax }}
                                    </td>
                                </tr>

                                <!-- Disc -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Disc
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ form.disc }}
                                    </td>
                                </tr>

                                <!-- Services Charges -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Service Charges
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ form.service_charges }}
                                    </td>
                                </tr>

                                <!-- Net Amount  -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Net Amount
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ form.net_amount }}
                                    </td>
                                </tr>

                                <!-- Received -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Total Amount
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ form.received_amount }}
                                    </td>
                                </tr>

                                <!-- payment_type -->
                                <tr class="">
                                    <td style="font-size: 16px;" colspan="2">
                                        Pay Type
                                    </td>
                                    <td style="text-align: center font-size: 16px;"></td>

                                    <td style="text-align: right;">
                                        {{ form.payment_type }}
                                    </td>
                                </tr>
                            </table>

                            <p style="text-align: center">
                                Thank You! <br>
                                Please visit again
                            </p>

                        </div>
                        <br>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">
                                <i class="fa fa-credit-card"></i>
                                Print
                            </button>
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


export default {
    components: {
        CashierMaster,
        TopLink,
    },
    name: "ShowInvoice",

    props: [
        'user_name',
        'login_time',

        'show_order_info',
        'order_items',

        'customers',
    ],

    data() {
        return {
            form: {
                customer: this.show_order_info.customer_id,
                tax: this.show_order_info.tax_amount,
                disc: this.show_order_info.discount,
                service_charges: this.show_order_info.service_charges,
                net_amount: this.show_order_info.net_amount,
                received_amount: this.show_order_info.received_amount,
                change_amount: this.show_order_info.change_amount,
                payment_type: this.show_order_info.payment_type,
                show_order_info: this.show_order_info.id,
            }
        }
    },

    methods: {
        amountCalc(order_item) {
            return order_item.price * order_item.qty;
        },

        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        submitPayment() {
            this.$inertia.post('/preview_payment', this.form);
        }
    }
}
</script>
<style>
.ScrollStyle1 {
    max-height: 1000px;
    overflow-y: scroll;
}

.billInput {
    width: 140px;
    height: 30px;
    text-align: right;
    border-radius: 4px;
}
</style>