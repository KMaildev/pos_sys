<template>
    <master :user_name="user_name">
        <div class="row">
            <div class="col-xl-6 col-md-6 col-lg-6 col-sm-12" style="height: 580px;">
                <div class="d-flex">
                    <MainMenu></MainMenu>
                </div>

                <div class="row gx-3 gy-2 align-items-center py-2">
                    <SearchFormBack></SearchFormBack>
                </div>

                <div class="card-body overflow-auto" style="max-height: calc(500px);">
                    <table class="table">
                        <thead class="table" style="background-color: #f4d9b0;">
                            <tr>
                                <th style="width: 1%; font-size: 18px;">
                                    Sr
                                </th>
                                <th style="width: 40%; font-size: 18px;">
                                    Descriptions
                                </th>
                                <th class="text-center" style="width: 20%; font-size: 18px;">
                                    Prices
                                </th>
                                <th class="text-center" style="width: 20%; font-size: 18px;">
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(menu_list, index) in menu_lists" :key="index"
                                style="background-color: #FCE6C4;">
                                <td>
                                    {{ index + 1 }}
                                </td>

                                <td>
                                    {{ menu_list.menu_name }}
                                    <hr class="divider">
                                    {{ menu_list.menu_name_mm }}
                                </td>

                                <td class="text-center">
                                    {{ menu_list.price }}
                                </td>

                                <td class="text-center">
                                    <button  class="order_btn btn btn-lg" @click="addToCart(menu_list)">
                                        Order
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <OrderItem></OrderItem>
        </div>
    </master>
</template>
<script>
import Master from "../Layout/Master";
import MainMenu from './components/MainMenu.vue';
import OrderItem from './components/OrderItem.vue';
import SearchFormBack from './components/SearchFormBack.vue';
export default {
    components: {
        Master,
        MainMenu,
        OrderItem,
        SearchFormBack,
    },
    name: "MenuLists",

    props: [
        'menu_lists',
        'user_name',
    ],

    data() {
        return {
            form: {
                q: this.q,
            }
        }
    },

    methods: {
        addToCart(menu_list) {
            var cart = this.$root.cart;
            var isInCart = cart.find(v => {
                return v.id == menu_list.id;
            });
            if (isInCart) {
                isInCart.qty++
            } else {
                cart.push({ ...menu_list, qty: 1, remark: '' });
            }
        },
    },
}
</script>
<style>
.order_btn {
    background-color: #F2F2F2 !important;
    color: black !important;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    font-family: 'Times New Roman', Times, serif;
}

.order_btn:hover {
    background-color: #F2F2F2 !important;
    color: black !important;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    font-family: 'Times New Roman', Times, serif;
}

hr.divider {
    margin: 1px;
}
</style>