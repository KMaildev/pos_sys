<template>
    <div>
        <button class="report_button" @click="saleReportLink()">
            Sale Report
        </button>

        <button class="report_button" @click="customerLink()">
            Cashier Report
        </button>

        <button class="report_button" @click="customerLink()">
            Management Report
        </button>
    </div>
</template>
<script>
export default {
    name: "MenuButton",

    methods: {
        saleReportLink() {
            this.$inertia.get(`/pos_sale_report`);
        },

        customerLink() {
            this.$inertia.get(`/cashier_customer`);
        },
    }
}
</script>
<style>

</style>