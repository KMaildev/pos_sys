<template>
    <div>
        <div class="col-md-12 col-lg-12 col-sm-12">
            <button class="report_button_sub" @click="saleReportLink()" style="background-color: #d5d6ea; color: black !important">
                Sales Report
            </button>

            <button class="report_button_sub" @click="StaffSales()" style="background-color: #f6f6eb; color: black !important">
                Staff Sales
            </button>

            <button class="report_button_sub" @click="TablesSales()" style="background-color: #d7ecd9; color: black !important">
                Tables Sales
            </button>

            <button class="report_button_sub" @click="PaymentTypesReport()" style="background-color: #f5d5cb; color: black !important">
                Payment Types
            </button>

            <button class="report_button_sub" @click="DiscountReport()" style="background-color: #f6ecf5; color: black !important">
                Discount Report
            </button>

            <button class="report_button_sub" @click="DiscountAmpReport()" style="background-color: #f6ecf5; color: black !important">
                AMP Report
            </button>

            <button class="report_button_sub" @click="VoidReport()" style="background-color: #e8dff5; color: black !important">
                Void Report
            </button>

            <button class="report_button_sub" @click="XReport()" style="background-color: #e8dff5; color: black !important">
                X Report
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

        DiscountAmpReport(){
            this.$inertia.get(`/pos_amp_report`);
        },

        VoidReport() {
            this.$inertia.get(`/pos_void_report`);
        },

        XReport(){
            this.$inertia.get(`/pos_x_report`);
        },

        YReport(){
            this.$inertia.get(`/pos_y_report`);
        }
    }
}
</script>
<style>

</style>