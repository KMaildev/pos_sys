<template>
    <div>
        <div class="col-md-12 col-lg-12 col-sm-12">
            <button class="report_button_sub" @click="saleReportLink()">
                Sales Report
            </button>

            <button class="report_button_sub" @click="StaffSales()">
                Staff Sales
            </button>

            <button class="report_button_sub" @click="TablesSales()">
                Tables Sales
            </button>

            <button class="report_button_sub" @click="PaymentTypesReport()">
                Payment Types
            </button>

            <button class="report_button_sub" @click="DiscountReport()">
                Discount Report
            </button>

            <button class="report_button_sub" @click="VoidReport()">
                Void Report
            </button>
        </div>
    </div>
</template>
<script>
export default {
    name: "MenuButton",

    methods: {
        saleReportLink() {
            this.$inertia.get(`/pos_sale_report`);
        },

        StaffSales() {
            this.$inertia.get(`/pos_staff_sales`);
        },

        TablesSales() {
            this.$inertia.get(`/pos_tables_sales`);
        },

        PaymentTypesReport() {
            this.$inertia.get(`/pos_payment_types_report`);
        },

        DiscountReport() {
            this.$inertia.get(`/pos_discount_report`);
        },

        VoidReport() {
            this.$inertia.get(`/pos_void_report`);
        },
    }
}
</script>
<style>

</style>