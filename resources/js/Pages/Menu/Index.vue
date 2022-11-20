<template>
    <master>
        <div class="row">
            <!-- Ordre Item  -->
            <OrderItem :cart_temps="cart_temps"></OrderItem>

            <!-- Menu Meal List  -->
            <MenuList :menu_lists="menu_lists" :category_title="category_title"></MenuList>
            <!-- Main Category  -->
            <MainCategory :categories="categories"></MainCategory>

        </div>
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
    ],
}
</script>
<style>

</style>