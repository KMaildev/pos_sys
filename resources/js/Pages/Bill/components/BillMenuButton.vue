<template>
    <div>
        <button class="floor_button" @click="billTableLink()">
            Bill
        </button>

        <button class="floor_button" @click="customerLink()">
            Customer
        </button>
    </div>
</template>
<script>
export default {
    name: "BillMenuButton",

    methods: {
        billTableLink(url) {
            this.$inertia.get(`/bill_table_lists`);
        },

        customerLink() {
            this.$inertia.get(`/cashier_customer`);
        },
    }
}
</script>
<style>

</style>