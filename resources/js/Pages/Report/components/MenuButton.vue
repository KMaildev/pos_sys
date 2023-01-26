<template>
    <div>
        <button class="report_button" @click="saleReportLink()" style="background-color: #e0bbe9; color: black !important">
            Sale Report
        </button>

        <button class="report_button" @click="cashierReportLink()" style="background-color: #957dad; color: black !important">
            Cashier Report
        </button>

        <button class="report_button" @click="managementReport()" style="background-color: #d291bc; color: black !important">
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

        managementReport() {
            this.$inertia.get(`/pos_sales_category_amount`);
        },
    }
}
</script>
<style>

</style>