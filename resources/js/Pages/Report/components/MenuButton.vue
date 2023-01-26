<template>
    <div>
        <button class="report_button" @click="saleReportLink()">
            Sale Report
        </button>

        <button class="report_button" @click="cashierReportLink()">
            Cashier Report
        </button>

        <button class="report_button" @click="cashierReportLink()">
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

        cashierReportLink() {
            this.$inertia.get(`/pos_cash_report`);
        },
    }
}
</script>
<style>

</style>