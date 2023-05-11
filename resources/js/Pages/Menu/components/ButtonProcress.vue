<template>
    <div>
        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-4 col-lg-4 col-md-4 py-2">
                    <div class="d-flex bd-highlight">
                        <h4 class="card-title mb-0 flex-grow-1 footer_title"
                            style="font-size: 16px; font-weight: bold; text-align: left;">
                            Total
                        </h4>
                        <h4 class="card-title mb-0 flex-grow-1 footer_title"
                            style="font-size: 16px; font-weight: bold; text-align: right;">
                            {{ totalAmountCalc(this.form.cart_lists) }}
                        </h4>
                    </div>
                </div>

                <div class="col-sm-8 col-lg-8 col-md-8">
                    <div class="d-flex bd-highlight">
                        <div class="p-2 flex-fill bd-highlight">
                            <button @click="orderConfirm()" class="pay_btn">
                                Order Confirm
                            </button>
                        </div>

                        <div class="p-2 flex-fill bd-highlight">
                            <button @click="clearAll()" class="clear_all">
                                Clear All
                            </button>
                        </div>

                        <div class="p-2 flex-fill bd-highlight">
                            <button @click="editSeat()" class="edit_seat_btn">
                                Edit Seat
                            </button>
                        </div>


                        <div class="p-2 flex-fill bd-highlight">
                            <button class="split_bill_btn">
                                Split bill
                            </button>
                        </div>

                        <div class="p-2 flex-fill bd-highlight">
                            <button class="promotion_btn">
                                Promotion
                            </button>
                        </div>
                    </div>
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
            total_amount: 0,
            form: {
                table_list_id: null,
                guest_no: '',
                cart_lists: [],
            }
        }
    },

    methods: {
        orderConfirm() {
            this.form.guest_no = localStorage.getItem("guest_no");
            if (this.form.table_list_id == null || this.form.table_list_id == '' || this.form.table_list_id == undefined) {
                swal({
                    title: "Please Select Seat",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            } else if (this.form.guest_no == null || this.form.guest_no == '' || this.form.guest_no == undefined) {
                swal({
                    title: "Please Enter Guest No",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            } else if (this.form.cart_lists.length == 0 || this.form.cart_lists.length === '0') {
                swal({
                    title: "You need to added the items you want to order.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            } else {
                swal({
                    title: "Confirm Your Order",
                    text: "Are you sure want to order?",
                    buttons: true,
                    dangerMode: false,
                }).then((willDelete) => {
                    if (willDelete) {
                        this.$inertia.post('/order_confirm', this.form);
                        this.orderSuccess();
                        this.clearAllNoAlert();
                    }
                });
            }
        },

        editSeat() {
            this.$inertia.get(`/pos_table_lists`);
        },

        clearAll() {
            swal({
                title: "Confirm Your Action",
                text: "Are you sure want to All Clear?",
                buttons: true,
                dangerMode: false,
            }).then((willDelete) => {
                if (willDelete) {
                    var cart = this.$root.cart;
                    cart.splice(0, cart.length);
                }
            });
        },

        clearAllNoAlert() {
            var cart = this.$root.cart;
            cart.splice(0, cart.length);
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

        orderFailed() {
            swal({
                title: "Order Failed!!!",
                text: "Order not placed due to some reason. Please Try Again!!!. Thank You !!!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {

                });
        },

        orderSuccess() {
            swal({
                title: "Order Success",
                text: "Your order has been placed!",
                icon: "success",
                buttons: true,
                dangerMode: false,
            })
                .then((willDelete) => {

                });
        },

        totalAmountCalc(cart_lists) {
            let sum = 0;
            cart_lists.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },
    },

    created() {
        this.form.cart_lists = this.$root.cart;
        this.form.table_list_id = localStorage.getItem("table_id");
        this.form.guest_no = localStorage.getItem("guest_no");
    }
}
</script>
<style>

</style>