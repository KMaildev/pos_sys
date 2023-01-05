<template>
    <div>
        <div class="d-flex flex-column">
            <button @click="orderConfirm()" class="pay_btn">
                Order <br> Confirm
            </button>

            <button @click="editSeat()" class="edit_seat_btn">
                Edit <br> Seat
            </button>

            <button @click="guestDetailIndex()" class="guest_detail_btn">
                Gust <br> Details
            </button>

            <button @click="clearAll()" class="clear_all">
                Clear <br> All
            </button>

            <button class="split_bill_btn">
                Split <br> bill
            </button>
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

        guestDetailIndex() {
            this.$inertia.get(`/pos_guest_index`);
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