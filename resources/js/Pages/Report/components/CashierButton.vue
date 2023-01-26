<template>
    <div>
        <div class="col-md-12 col-lg-12 col-sm-12">
            <button class="report_button_sub_cashier" @click="cashReport()" style="background-color: #d5d6ea; color: black !important">
                Cash Report
            </button>

            <button class="report_button_sub_cashier" @click="OnlinePay()" style="background-color: #f6f6eb; color: black !important">
                Online Pay Report
            </button>

            <button class="report_button_sub_cashier" @click="BankingReport()" style="background-color: #d7ecd9; color: black !important">
                Banking Report
            </button>
        </div>
    </div>
</template>
<script>
export default {
    name: "CashierButton",

    methods: {
        cashReport() {
            this.$inertia.get(`/pos_cash_report`);
        },

        OnlinePay() {
            this.$inertia.get(`/pos_online_pay`);
        },

        BankingReport() {
            this.$inertia.get(`/pos_banking_report`);
        },
    }
}
</script>
<style>

</style>