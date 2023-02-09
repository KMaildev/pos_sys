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
                                            Online Pay Type
                                        </th>

                                        <th class="text-center">
                                            Total Amount
                                        </th>

                                        <th class="text-center">
                                            Received Amount
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(bill_info, index) in bill_infos" :key="bill_info.id"
                                        v-if="bill_info.payment_method_table.account_type == 'OnlinePayAccount'">
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
                                            {{ bill_info.payment_method_table.name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.total_amount ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ bill_info.net_amount ?? '' }}
                                        </td>
                                    </tr>
                                </tbody>
                                <tr style="background-color: white;">
                                    <td colspan="5">
                                        Total
                                    </td>

                                    <!--Discount Amount-->
                                    <td class="text-center">
                                        {{ totalReceivedAmount() }}
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
    name: "OnlinePay",
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
        totalReceivedAmount() {
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                if (item.payment_method_table.account_type == 'OnlinePayAccount') {
                    sum += +item.net_amount
                }
            });
            return sum;
        },

        searchDate() {
            this.$inertia.get(`/pos_online_pay`, this.form);
        }
    }
};
</script>
<style>

</style>