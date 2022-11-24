<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>

            <div class="row py-3">

                <div class="col-xl-3 col-md-6">
                    <div class="card card-h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">
                                        Total Order
                                    </span>
                                    <h4 class="mb-3">
                                        <span class="counter-value" data-target="354.5">
                                            {{ total_order_infos }}
                                        </span>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card card-h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">
                                        Total Sales
                                    </span>
                                    <h4 class="mb-3">
                                        MMK
                                        <span class="counter-value" data-target="354.5">
                                            {{ total_price }}
                                        </span>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card card-h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">
                                        Total Menu
                                    </span>
                                    <h4 class="mb-3">
                                        <span class="counter-value" data-target="354.5">
                                            {{ total_menu_lists }}
                                        </span>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="card card-h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">
                                        Total Customers
                                    </span>
                                    <h4 class="mb-3">
                                        <span class="counter-value" data-target="354.5">
                                            {{ total_customers }}
                                        </span>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <!-- card -->
                    <div class="card">
                        <!-- card body -->
                        <div class="card-body">
                            <div class="d-flex flex-wrap align-items-center mb-4">
                                <h5 class="card-title me-2">Sale Chart</h5>
                            </div>
                            <h1>Build in progress</h1>
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

        'total_price',
        'total_customers',
        'total_order_infos',
        'total_menu_lists',

        'order_items_labels',
        'order_items_data',
    ],

    data() {
        return {
        }
    },

    methods: {

    }
}
</script>
<style>

</style>