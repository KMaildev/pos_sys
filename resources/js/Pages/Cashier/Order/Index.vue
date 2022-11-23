<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>

            <div class="container-fluid ScrollStyle1">
                <div class="row py-4">
                    <div class="col-md-12">
                        <OrderList :order_infos="order_infos"></OrderList>
                    </div>
                </div>
            </div>

        </CashierMaster>
    </div>
</template>
<script>

import CashierMaster from "../../Layout/CashierMaster.vue";
import TopLink from "../Shared/TopLink.vue";
import OrderList from "./OrderList.vue";


export default {
    components: {
        CashierMaster,
        TopLink,
        OrderList,
    },
    name: "Index",

    props: [
        'user_name',
        'login_time',
        'order_infos',
    ],
}
</script>
<style>
.ScrollStyle1 {
    max-height: 1000px;
    overflow-y: scroll;
}
</style>