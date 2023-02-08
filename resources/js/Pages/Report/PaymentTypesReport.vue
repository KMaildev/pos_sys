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

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="table-responsive text-nowrap">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>
                                        <th class="text-center" style="width: 10%;">
                                            Payment
                                        </th>
                                        <th class="text-center" style="width: 10%;">
                                            Amount
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(payment_method, index) in payment_methods" :key="payment_method.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ payment_method.name }}
                                        </td>

                                        <td class="text-center">
                                            {{ totalAmount(payment_method) }}
                                        </td>
                                    </tr>
                                </tbody>

                                <tr style="background-color: white;">
                                    <td colspan="2">
                                        Total
                                    </td>

                                    <!--Sales Bills	-->
                                    <td class="text-center">
                                        {{ AlltotalAmount() }}
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
            },
        }
    },

    props: [
        'user_name',
        'payment_methods',
        'bill_infos_table',
    ],

    methods: {

        totalAmount(payment_method) {
            let sum = 0;
            payment_method.bill_infos_table.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },

        AlltotalAmount() {
            let sum = 0;
            this.bill_infos_table.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },

        searchDate() {
            this.$inertia.get(`/pos_payment_types_report`, this.form);
        }
    }
};
</script>
<style>

</style>