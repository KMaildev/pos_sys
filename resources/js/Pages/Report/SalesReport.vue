<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <MenuButton></MenuButton>
                </div>

                <div class="row">
                    <SaleButton></SaleButton>
                </div>


                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 py-3">
                        <div class="table-responsive text-nowrap">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>
                                        <th class="text-center">
                                            Date
                                        </th>
                                        <th class="text-center">
                                            Invoices No.
                                        </th>
                                        <th class="text-center">
                                            Item Qty
                                        </th>
                                        <th class="text-center">
                                            Sales Amount
                                        </th>
                                        <th class="text-center">
                                            Discount Percentage
                                        </th>

                                        <th class="text-center">
                                            Discount Amount
                                        </th>

                                        <th class="text-center">
                                            Tax Percentage
                                        </th>

                                        <th class="text-center">
                                            Tax Amount
                                        </th>

                                        <th class="text-center">
                                            Void
                                        </th>
                                        <th class="text-center">
                                            Total Net Sales
                                        </th>
                                        <th class="text-center">
                                            First Tables
                                        </th>
                                        <th class="text-center">
                                            Main Tables
                                        </th>
                                        <th class="text-center">
                                            Payment Types
                                        </th>
                                        <th class="text-center">
                                            Sales Person
                                        </th>
                                        <th class="text-center">
                                            Cashier
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="bill_info in bill_infos" :key="bill_info.id">
                                        <td class="text-center">
                                            {{ bill_info.id ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.bill_date_time ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.inv_no ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ totalQty(bill_info) }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.total_amount ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.discount }}
                                            %
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.total_amount * bill_info.discount / 100 }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.tax_amount }}
                                            %
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.total_amount * bill_info.tax_amount / 100 }}
                                        </td>

                                        <td class="text-center">
                                            {{ voidTotalQty(bill_info) }}
                                        </td>

                                        <td class="text-center">
                                            {{ totalNetSale(bill_info) }}
                                        </td>

                                        <td class="text-center">
                                            <span v-if="bill_info.first_table_lists_table">
                                                {{ bill_info.first_table_lists_table.table_name ?? '' }}
                                            </span>
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.table_lists_table.table_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.payment_method_table.name }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.waiter_user_table.name }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.cashier_user.name }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
import SaleButton from "./components/SaleButton.vue";
import swal from 'sweetalert2';
window.Swal = swal;

export default {
    name: "SalesReport",
    components: {
        Master,
        MenuButton,
        SaleButton
    },

    data() {
        return {

        }
    },

    props: [
        'user_name',
        'bill_infos'
    ],

    methods: {
        totalNetSale(bill_info) {
            var totalAmount = bill_info.total_amount;
            var taxrate = bill_info.tax_amount;
            var disc = bill_info.discount;

            var totalTaxNetAmount = totalAmount * taxrate / 100;
            var totalDiscNetAmount = totalAmount * disc / 100;
            var netAmount = totalAmount - (totalTaxNetAmount + totalDiscNetAmount);
            return netAmount;
        },

        totalQty(bill_info) {
            let sum = 0;
            bill_info.order_items_table.forEach(function (item) {
                sum += +item.qty;
            });
            return sum;
        },


        voidTotalQty(bill_info) {
            let sum = 0;
            bill_info.void_items_table.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        }
    }
};
</script>
<style>

</style>