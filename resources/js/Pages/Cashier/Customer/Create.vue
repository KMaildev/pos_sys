<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>
            <div class="container-fluid ScrollStyle1">
                <div class="row py-4">
                    <CustomerForm :customer="customer" @submit="submit"></CustomerForm>
                </div>
            </div>
        </CashierMaster>
    </div>
</template>
<script>

import CashierMaster from "../../Layout/CashierMaster.vue";
import TopLink from "../Shared/TopLink.vue";
import CustomerForm from "./CustomerForm.vue";


export default {
    components: {
        CashierMaster,
        TopLink,
        CustomerForm,
    },
    name: "Create",

    props: [
        'user_name',
        'login_time',
        'customer',
    ],

    methods: {
        submit(form) {
            this.$inertia.post('/cashier_customer_store', form);
        }
    }
}
</script>
<style>

</style>