<template>
    <master :user_name="user_name" :login_time="login_time">
        <div class="row">

            <div class="col-md-12 py-3">
                <form @submit.prevent="searchDate">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon1">Start Date</span>
                                <input type="date" class="form-control date_picker" v-model="form.start_date">
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon1">End Date</span>
                                <input type="date" class="form-control date_picker" v-model="form.end_date">
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon1">
                                    Table
                                </span>
                                <select v-model="form.table_name" class="form-control">
                                    <option value="" selected>All Table</option>
                                    <option :value="table.table_name" v-for="table in tables" :key="table.id">
                                        {{ table.table_name }}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon1">
                                    User
                                </span>
                                <select v-model="form.waiter_name" class="form-control">
                                    <option value="" selected>All</option>
                                    <option :value="user.name" v-for="user in users" :key="user.id">
                                        {{ user.name }}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="submit" class="btn btn-dark">Search</button>
                                <button type="submit" class="btn btn-secondary">Reset</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-xl-3 col-md-3 col-lg-3" style="height: 300px;" v-for="order_info in order_infos"
                :key="order_info.id">
                <div @click="billHistory(order_info.id, order_info.check_out_status)">

                    <div class="card-header d-flex">
                        <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 11px; text-align: left;">
                            TBL : {{ order_info.table_lists_table.table_name }}
                        </h4>

                        <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 11px; text-align: left;">
                            <i class="fa fa-clock"></i> {{ order_info.order_time }}
                        </h4>

                        <h4 class="card-title mb-0 flex-grow-1 guest_title" style="font-size: 11px; text-align: right;">
                            GUEST : {{ order_info.guest_no }}
                        </h4>
                    </div>

                    <div class="card-body overflow-auto" style="height: 200px; background-color: white;">
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
                                <tr v-for="order_item in order_info.order_items_table" :key="order_item.id">
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
                            style="font-size: 12px; font-weight: bold; text-align: left;">
                            <i class="fa fa-user"></i> {{ order_info.waiter_user_table.name }}
                        </h4>

                        <h4 class="card-title mb-0 flex-grow-1 guest_title"
                            style="font-size: 12px; font-weight: bold; text-align: right;">
                            Total : {{ totalAmountCalc(order_info.order_items_table) }}
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </master>
</template>
<script>

import Master from "../Layout/Master";

export default {
    name: "Index",
    components: {
        Master
    },

    data() {
        return {
            q: '',
            form: {
                start_date: this.start_date,
                end_date: this.end_date,
                table_name: this.table_name,
                waiter_name: this.waiter_name,
            }
        }
    },

    props: [
        'user_name',
        'login_time',
        'order_infos',
        'tables',
        'users',
    ],

    methods: {
        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        searchDate() {
            this.$inertia.get(`/pos_guest_index`, this.form);
        },

        billHistory(id, check_out_status) {
            if (check_out_status === 'paid') {
                this.$inertia.get(`/bill_history/${id}`);
            }else{
                this.$inertia.get(`/bill_payment/${id}`);
            }
        },
    }
}
</script>