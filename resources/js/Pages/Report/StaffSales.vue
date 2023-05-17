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
                                <thead  style="background-color: #F6F6EB;">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>
                                        <th class="text-center">
                                            Sales Person
                                        </th>
                                        <th class="text-center">
                                            Sales Bills
                                        </th>
                                        <th class="text-center">
                                            Gross Sales
                                        </th>
                                        <th class="text-center">
                                            Void Qty
                                        </th>

                                        <th class="text-center">
                                            Net Sales Amount
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(waiter, index) in waiters" :key="waiter.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ waiter.name }}
                                        </td>

                                        <td class="text-center">
                                            {{ SalesBills(waiter) }}
                                        </td>

                                        <td class="text-center">
                                            {{ GrossBills(waiter) }}
                                        </td>

                                        <td class="text-center">
                                            {{ VoidQty(waiter) }}
                                        </td>

                                        <td class="text-center">
                                            {{ totalNetSale(waiter) }}
                                        </td>

                                    </tr>
                                </tbody>

                                <tr style="background-color: #d0cfd1;">
                                    <td colspan="2">
                                        Total
                                    </td>

                                    <!-- Sales Bills -->
                                    <td class="text-center">
                                        {{ SalesBillsTotal() }}
                                    </td>

                                    <!--Gross Sales	-->
                                    <td class="text-center">
                                        {{ GrossBillsTotal() }}
                                    </td>

                                    <!--Void Qty	-->
                                    <td class="text-center">
                                        {{ VoidQtyTotal() }}
                                    </td>

                                    <!-- Net Sales Amount	-->
                                    <td class="text-center">
                                        {{ totalNetSaleTotal() }}
                                    </td>

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
    name: "StaffSales",
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
        'waiters',
        'bill_infos',
        'void_items',
    ],

    methods: {

        totalNetSale(waiter) {
            let sum = 0;
            waiter.bill_infos_table.forEach(function (item) {
                var totalAmount = item.total_amount;
                var taxrate = item.tax_amount;
                var disc = item.discount;
                var discount_amount = item.discount_amount;

                var totalTaxNetAmount = totalAmount * taxrate / 100;
                var totalDiscNetAmount = totalAmount * disc / 100;
                var netAmount = (+totalAmount + +totalTaxNetAmount) - (+totalDiscNetAmount + +discount_amount);
                sum += netAmount;
            });
            return sum;
        },

        totalNetSaleTotal() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                var totalAmount = item.total_amount;
                var taxrate = item.tax_amount;
                var disc = item.discount;
                var discount_amount = item.discount_amount;

                var totalTaxNetAmount = totalAmount * taxrate / 100;
                var totalDiscNetAmount = totalAmount * disc / 100;
                var netAmount = (+totalAmount + +totalTaxNetAmount) - (+totalDiscNetAmount + +discount_amount);
                sum += netAmount;
            });
            return sum;
        },

        SalesBills(waiter) {
            let sum = 0;
            waiter.bill_infos_table.forEach(function (item) {
                sum += 1;
            });
            return sum;
        },


        SalesBillsTotal() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                sum += 1;
            });
            return sum;
        },

        GrossBills(waiter) {
            let sum = 0;
            waiter.bill_infos_table.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },


        GrossBillsTotal() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },

        VoidQty(waiter) {
            let sum = 0;
            waiter.void_items_table.forEach(function (item) {
                sum += +item.qty;
            });
            return sum;
        },


        VoidQtyTotal() {
            let sum = 0;
            this.void_items.forEach(function (item) {
                sum += +item.qty;
            });
            return sum;
        },

        searchDate() {
            this.$inertia.get(`/pos_staff_sales`, this.form);
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
<style>

</style>