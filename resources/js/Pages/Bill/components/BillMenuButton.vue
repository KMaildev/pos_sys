<template>
    <div>
        <button class="floor_button" @click="billTableLink()">
            Bill
        </button>

        <button class="floor_button" @click="customerLink()">
            Customer
        </button>

        <button class="floor_button" @click="guestDetailIndex()">
            Guest Details
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

        guestDetailIndex() {
            this.$inertia.get(`/pos_guest_index`);
        },
    }
}
</script>
<style>

</style>