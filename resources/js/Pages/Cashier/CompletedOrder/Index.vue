<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>
            <div class="container-fluid ScrollStyle1">
                <div class="row py-4">
                    <div class="card">
                        <div class="card-body">

                            <div class="row mb-2">
                                <div class="col-sm-3 col-lg-3 col-md-3">
                                    <div class="search-box me-2 mb-2">
                                        <div class="position-relative">
                                            <form @submit.prevent="searchBillInfo">
                                                <input v-model="q" type="text" class="form-control"
                                                    placeholder="Search">
                                                <i class="bx bx-search-alt search-icon"></i>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <form @submit.prevent="filterDateSearch" class="row gx-3 gy-2">
                                        <div class="col-sm-5">
                                            <input type="date" class="form-control" v-model="start_date">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="date" class="form-control" v-model="end_date">
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="submit" class="btn btn-primary">
                                                Search
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table border-no mydatatable">
                                    <thead class="table-light">
                                        <tr class="tablebg">
                                            <th class="text-center" style="width: 1%;">#</th>
                                            <th class="text-center">Invoice</th>
                                            <th class="text-center">Order No</th>
                                            <th class="text-center">Order Date & Time</th>
                                            <th class="text-center">Bill Date & Time</th>
                                            <th class="text-center">Table</th>
                                            <th class="text-center">Guest</th>
                                            <th class="text-center">Waiter</th>
                                            <th class="text-center">Cashier</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="bill_info in bill_infos" :key="bill_info.id" class="text-center">
                                            <td>
                                                {{ bill_info.id }}
                                            </td>

                                            <td>
                                                {{ bill_info.order_infos_table.inv_no }}
                                            </td>

                                            <td>
                                                {{ bill_info.order_infos_table.order_no }}
                                            </td>

                                            <td>
                                                {{ bill_info.order_infos_table.order_date_time }}
                                            </td>

                                            <td>
                                                {{ bill_info.bill_date_time }}
                                            </td>

                                            <td>
                                                {{ bill_info.table_lists_table.table_name }}
                                            </td>

                                            <td>
                                                {{ bill_info.order_infos_table.guest_no }}
                                            </td>

                                            <td>
                                                {{ bill_info.waiter_user_table.name ?? '' }}
                                            </td>

                                            <td>
                                                {{ bill_info.cashier_user.name ?? '' }}
                                            </td>

                                            <td>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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
    name: "Index",

    props: [
        'user_name',
        'login_time',
        'bill_infos',
    ],

    data() {
        return {
            q: '',
            start_date: '',
            end_date: '',
        }
    },

    methods: {
        searchBillInfo() {
            this.$inertia.get(`/completed_cashier_order?keyword=${this.q}`);
        },

        filterDateSearch() {
            this.$inertia.get(`/completed_cashier_order?start_date=${this.start_date}&end_date=${this.end_date}`);
        }
    }
}
</script>
<style>
.ScrollStyle1 {
    max-height: 1000px;
    overflow-y: scroll;
}
</style>