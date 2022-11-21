<template>
    <master :user_name="user_name" :login_time="login_time">
        <div class="row" style="height: calc(600px - 25px);">
            <!-- Ordre Item  -->
            <OrderItem :cart_temps="cart_temps" :user_name="user_name"></OrderItem>
            <!-- Menu Meal List  -->
            <MenuList :menu_lists="menu_lists" :category_title="category_title"></MenuList>
            <!-- Main Category  -->
            <MainCategory :categories="categories"></MainCategory>
        </div>
        <footer class="py-5">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <button @click="orderConfirm()" class="pay_btn">
                            Pay
                        </button>
                    </div>

                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <button class="service_btn">
                            Services
                        </button>
                    </div>

                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <button @click="editSeat()" class="edit_seat_btn">
                            Edit Seat
                        </button>
                    </div>


                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <button @click="clearAll()" class="print_btn">
                            Clear All
                        </button>
                    </div>

                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <button class="comment_btn">
                            Comment
                        </button>
                    </div>

                    <div class="col-sm-2 col-lg-2 col-md-2">
                        <button @click="mainPage()" class="clear_btn">
                            Main
                        </button>
                    </div>

                </div>
            </div>
        </footer>
    </master>
</template>
<script>
import Master from "../Layout/Master";
import MainCategory from './components/MainCategory.vue';
import MenuList from './components/MenuList.vue';
import OrderItem from './components/OrderItem.vue';

export default {
    components: {
        Master,
        MainCategory,
        MenuList,
        OrderItem,
    },
    name: "Index",

    props: [
        'categories',
        'menu_lists',
        'category_title',
        'type',
        'category_id',
        'cart_temps',
        'table_name',
        'table_id',
        'user_name',
        'login_time',
    ],

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
    },

    created() {
        this.table_name = localStorage.getItem("table_name");
        this.table_id = localStorage.getItem("table_id");
    },
}
</script>
<style>

</style>