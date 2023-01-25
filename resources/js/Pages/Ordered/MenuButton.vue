<template>
    <div>
        <button class="floor_button" @click="orderedDetail(order_infos.id)">
            Ordered
        </button>

        <button class="floor_button" @click="tableTransfer(order_infos.id)">
            Transfer
        </button>

        <button class="floor_button" @click="splitBill(order_infos.id)">
            Split Order
        </button>

        <button class="floor_button" @click="splitBill(order_infos.id)">
            Void Order
        </button>

        <button class="floor_button" hidden>
            History of {{ order_infos.table_lists_table.table_name }}
        </button>
    </div>
</template>
<script>
export default {
    name: "MenuButton",

    props: [
        'order_infos',
    ],

    methods: {
        orderedDetail(id) {
            this.$inertia.get(`/ordered_detail/${id}`);
        },

        tableTransfer(order_info_id) {
            this.$inertia.get(`/table_transfer?order_info_id=${order_info_id}`);
        },

        splitBill(id) {
            this.$inertia.get(`/pos_split_bill/${id}`);
        },
    }
}
</script>
<style>

</style>