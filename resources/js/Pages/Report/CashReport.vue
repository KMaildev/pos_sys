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

                    <div class="col-md-12 col-lg-12 col-sm-12">
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
                                            {{ bill_info.net_amount - bill_info.received_amount }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.net_amount ?? '' }}
                                        </td>
                                    </tr>
                                </tbody>

                                <tr style="background-color: white;">
                                    <td colspan="3">
                                        Total
                                    </td>

                                    <!--Cash Rec-->
                                    <td class="text-center">
                                        {{ totalCashRec() }}
                                    </td>

                                    <!--Cash Rec-->
                                    <td class="text-center">
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

        totalDueAmount() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                sum += +item.net_amount
            });
            return sum;
        },



        searchDate() {
            this.$inertia.get(`/pos_cash_report`, this.form);
        }
    }
};
</script>
<style>

</style>