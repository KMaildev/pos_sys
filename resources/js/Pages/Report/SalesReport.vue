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
                    <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                        <form @submit.prevent="searchDate">
                            <div class="input-group">
                                <input type="date" class="form-control date_picker" v-model="form.start_date">
                                <input type="date" class="form-control date_picker" v-model="form.end_date">
                                <input type="submit" class="btn btn-dark" value="Search">
                            </div>
                        </form>
                    </div>

                    <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                        <button @click="exportExcel('xlsx')" class="btn btn-success">
                            <i class="text-white fa fa-file-excel"></i> Excel
                        </button>
                    </div>

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="table-responsive text-nowrap">

                            <table class="table table-bordered" id="tableId">
                                <thead style="background-color: #D5D6EA;">
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
                                            Amount of Dis (%)
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
                                            Service Charges Percentage
                                        </th>

                                        <th class="text-center">
                                            Amount of Service Charges (%)
                                        </th>

                                        <th class="text-center">
                                            Service Charges Amount
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
                                    <tr v-for="(bill_info, index) in bill_infos" :key="bill_info.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
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

                                        <!-- Discount % Amount -->
                                        <td class="text-center">
                                            {{ bill_info.total_amount * bill_info.discount / 100 }}
                                        </td>

                                        <!-- Discount Amount -->
                                        <td class="text-center">
                                            {{ bill_info.discount_amount }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.tax_amount }}
                                            %
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.total_amount * bill_info.tax_amount / 100 }}
                                        </td>

                                        <!-- Service Charge  -->
                                        <td class="text-center">
                                            {{ bill_info.service_charges }}
                                            %
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.total_amount * bill_info.service_charges / 100 }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.service_charge_amount }}
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
                                <tr style="background-color: #d0cfd1;">
                                    <td colspan="4">
                                        Total
                                    </td>

                                    <td class="text-center">
                                        {{ TotalSalesAmount(bill_infos) }}
                                    </td>

                                    <td class="text-center"></td>

                                    <!-- Discount % Amount -->
                                    <td class="text-center">
                                        {{ TotalDiscountAmount(bill_infos) }}
                                    </td>

                                    <!-- Discount Amount -->
                                    <td class="text-center">
                                        {{ DiscountAmountTotal(bill_infos) }}
                                    </td>

                                    <td colspan="6" class="text-center"></td>

                                    <!--Total Net Sales	-->
                                    <td class="text-center">
                                        {{ TotalNetSalesAmount(bill_infos) }}
                                    </td>

                                    <td colspan="5" class="text-center"></td>

                                </tr>
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
            form: {
                start_date: this.start_date,
                end_date: this.end_date,
            }
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
            var discount_amount = bill_info.discount_amount;

            var totalTaxNetAmount = totalAmount * taxrate / 100;
            var totalDiscNetAmount = totalAmount * disc / 100;
            var netAmount = (+totalAmount + +totalTaxNetAmount) - (+totalDiscNetAmount + +discount_amount);
            return netAmount;
        },


        TotalSalesAmount(bill_infos) {
            let sum = 0;
            bill_infos.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },

        TotalDiscountAmount(bill_infos) {
            let sum = 0;
            bill_infos.forEach(function (item) {
                var total_amount = +item.total_amount;
                var discount = +item.discount;
                sum += +total_amount * +discount / 100;
            });
            return sum;
        },

        DiscountAmountTotal(bill_infos) {
            let sum = 0;
            bill_infos.forEach(function (item) {
                sum += +item.discount_amount;
            });
            return sum;
        },

        TotalNetSalesAmount(bill_infos) {
            let sum = 0;
            bill_infos.forEach(function (bill_info) {
                var totalAmount = bill_info.total_amount;
                var taxrate = bill_info.tax_amount;
                var disc = bill_info.discount;
                var discount_amount = bill_info.discount_amount;

                var totalTaxNetAmount = totalAmount * taxrate / 100;
                var totalDiscNetAmount = totalAmount * disc / 100;
                sum += (+totalAmount + +totalTaxNetAmount) - (+totalDiscNetAmount + +discount_amount);
            });
            return sum;
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
        },

        searchDate() {
            this.$inertia.get(`/pos_sale_report`, this.form);
        },

        exportExcel(type, fn, dl) {
            var today = new Date();
            var date = today.getFullYear() + '_' + (today.getMonth() + 1) + '_' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + '_' + time;

            var tableId = document.getElementById('tableId');
            var wb = XLSX.utils.table_to_book(tableId, { sheet: "sheet1" });
            return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || (`export_excel_${dateTime}.` + (type || 'xlsx')));
        },

    }
};
</script>
<style></style>