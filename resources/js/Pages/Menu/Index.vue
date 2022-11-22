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

        <ButtonProcress></ButtonProcress>

    </master>
</template>
<script>
import Master from "../Layout/Master";
import MainCategory from './components/MainCategory.vue';
import MenuList from './components/MenuList.vue';
import OrderItem from './components/OrderItem.vue';
import ButtonProcress from './components/ButtonProcress.vue';


export default {
    components: {
        Master,
        MainCategory,
        MenuList,
        OrderItem,
        ButtonProcress,
    },
    name: "Index",

    props: [
        'categories',
        'menu_lists',
        'category_title',
        'type',
        'category_id',
        'cart_temps',
        'user_name',
        'login_time',
        'success',
    ],
}
</script>
<style>

</style>