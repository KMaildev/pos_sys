<template>
    <div>
        <div class="col-md-12 col-lg-12 col-sm-12">
            <button class="report_button_sub_cashier" @click="cashReport()">
                Cash Report
            </button>

            <button class="report_button_sub_cashier" @click="OnlinePay()">
                Online Pay Report
            </button>

            <button class="report_button_sub_cashier" @click="BankingReport()">
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