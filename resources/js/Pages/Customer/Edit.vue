<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <BillMenuButton></BillMenuButton>
                </div>

                <div class="col-md-12 col-lg-12 col-sm-12">
                    <CustomerForm :customer="customer" @submit="submit"></CustomerForm>
                </div>
            </div>
        </master>
    </div>
</template>
<script>
import Master from "../Layout/Master.vue";
import BillMenuButton from "../Bill/components/BillMenuButton.vue";
import CustomerForm from "./CustomerForm.vue";
export default {
    name: "Index",

    components: {
        Master,
        BillMenuButton,
        CustomerForm,
    },

    props: [
        'user_name',
        'customer',
    ],

    methods: {
        submit(form) {
            this.$inertia.put(`/cashier_customer_update/${this.customer.id}`, form);
        }
    }
};
</script>