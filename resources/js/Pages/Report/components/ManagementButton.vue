<template>
    <div>
        <div class="col-md-12 col-lg-12 col-sm-12">
            <button class="report_button_sub_sale" @click="saleCategoryAmount()" style="background-color: #d5d6ea; color: black !important">
                Sales Category Amount
            </button>

            <button class="report_button_sub_sale" @click="saleCategoryQty()" style="background-color: #f6f6eb; color: black !important">
                Sales Category Qty
            </button>

            <button class="report_button_sub_sale" @click="customerReport()" style="background-color: #f5d5cb; color: black !important">
                Customer Report
            </button>
        </div>
    </div>
</template>
<script>
export default {
    name: "MenuButton",

    methods: {
        saleCategoryAmount() {
            this.$inertia.get(`/pos_sales_category_amount`);
        },

        saleCategoryQty() {
            this.$inertia.get(`/pos_sales_category_qty`);
        },

        customerReport(){
            this.$inertia.get(`/pos_customer_report`);
        },
    }
}
</script>
<style>

</style>