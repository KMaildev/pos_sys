<template>
    <master :user_name="user_name">
        <div class="row">
            <div class="col-xl-12 col-md-12 col-lg-12 col-sm-12" style="height: 580px;">
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
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </master>
</template>
<script>
import Master from "../Layout/Master";
import MainMenu from './components/MainMenu.vue';
import SearchFormBack from './components/SearchFormBack.vue';
export default {
    components: {
        Master,
        MainMenu,
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
        
    },
}
</script>
<style>
.order_btn {
    background-color: #F2F2F2;
    color: black;
}

.order_btn:hover {
    background-color: #F2F2F2;
    color: black;
}

hr.divider {
    margin: 1px;
}
</style>