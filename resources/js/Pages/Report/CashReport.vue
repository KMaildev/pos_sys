<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <MenuButton></MenuButton>
                </div>

                <div class="row">
                    <CashierButton></CashierButton>
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
                                <thead  style="background-color: #D5D6EA;">
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
                                            Cash Rec
                                        </th>

                                        <th class="text-center">
                                            Cash Refund
                                        </th>

                                        <th class="text-center">
                                            Due Amount
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(bill_info, index) in bill_infos" :key="bill_info.id"
                                        v-if="bill_info.payment_method_table.account_type == 'Cash'">
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
                                            {{ bill_info.received_amount ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.refund_amount }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.net_amount }}
                                        </td>
                                    </tr>
                                </tbody>

                                <tr style="background-color: #d0cfd1;">
                                    <td colspan="3">
                                        Total
                                    </td>

                                    <!--Cash Rec-->
                                    <td class="text-center">
                                        {{ totalCashRec() }}
                                    </td>

                                    <!--Cash Rec-->
                                    <td class="text-center">
                                        {{ totalCashRefundAmount() }}
                                    </td>

                                    <td class="text-center">
                                        {{ totalDueAmount() }}
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
import CashierButton from "./components/CashierButton.vue";

export default {
    name: "CashReport",
    components: {
        Master,
        MenuButton,
        CashierButton
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
        totalCashRec() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                sum += parseFloat(item.received_amount);
            });
            return sum;
        },


        totalCashRefundAmount() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                sum += parseFloat(item.refund_amount);
            });
            return sum;
        },

        totalDueAmount() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                sum += +item.net_amount
            });
            return sum;
        },


        searchDate() {
            this.$inertia.get(`/pos_cash_report`, this.form);
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