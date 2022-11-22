<template>
    <div>
        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button class="service_btn">
                        Services
                    </button>
                </div>

                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button @click="orderConfirm()" class="pay_btn">
                        Pay
                    </button>
                </div>

            </div>

            <div class="row py-2">

                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button @click="clearAll()" class="print_btn">
                        Clear All
                    </button>
                </div>

                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button class="print_btn" @click="transactionCancel()">
                        Cancel
                    </button>
                </div>

                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button class="comment_btn" @click="orderNote()">
                        Order Note
                    </button>
                </div>

                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button class="comment_btn">
                        Change Qty
                    </button>
                </div>


                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button @click="editSeat()" class="edit_seat_btn">
                        Edit Seat
                    </button>
                </div>


                <div class="col-sm-2 col-lg-2 col-md-2">
                    <button @click="mainPage()" class="clear_btn">
                        Main
                    </button>
                </div>

            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: "ButtonProcress",

    data() {
        return {
            table_id: localStorage.getItem("table_id"),
        }
    },

    methods: {
        orderConfirm() {
            const table_list_id = this.table_id;
            if (table_list_id) {
                this.$inertia.get(`/order_confirm?table_list_id=${table_list_id}`);
            } else {
                this.alertMessage();
            }
        },

        editSeat() {
            this.$inertia.get(`/pos_table_lists`);
        },

        clearAll() {
            this.$inertia.get(`/clear_all`);
        },

        transactionCancel() {
            const active_item = localStorage.getItem("activeItemId");
            const menuName = localStorage.getItem("menuName");
            if (active_item == null) {
                this.alertSelectItemName();
            } else {
                swal({
                    title: menuName,
                    text: "Are you sure want to cancel?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            this.$inertia.get(`/transaction_cancel/${active_item}`);
                            localStorage.removeItem("activeItemId");
                            localStorage.removeItem("menuName");
                            swal(`Your processing has been completed`);
                        }
                    });
            }
        },

        orderNote() {
            const active_item = localStorage.getItem("activeItemId");
            const menuName = localStorage.getItem("menuName");
            if (active_item == null) {
                this.alertSelectItemName();
            } else {
                swal({
                    title: menuName,
                    text: "Enter Order Note",
                    content: 'input',
                    buttons: true,
                    dangerMode: true,
                })
                    .then((value) => {
                        this.$inertia.get(`/order_note?remark=${value}&cart_temp_id=${active_item}`);
                        localStorage.removeItem("activeItemId");
                        localStorage.removeItem("menuName");
                        swal(`Order Note: ${value}`);
                    });
            }

        },

        mainPage() {
            this.$inertia.get(`/pos_main_page`);
        },

        alertMessage() {
            swal({
                title: "Please Select Seat",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                    }
                });
        },

        alertSelectItemName() {
            swal({
                title: "Please Select Menu",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                    }
                });
        },
    },
}
</script>
<style>

</style>