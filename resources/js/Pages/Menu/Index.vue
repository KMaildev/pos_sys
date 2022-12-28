<template>
    <master :user_name="user_name" :login_time="login_time">
        <div class="row">
            <div class="col-xl-12 col-md-12 col-lg-12 col-sm-12 py-1">
                <AlphabetSearch></AlphabetSearch>
            </div>
            <!-- Ordre Item  -->
            <OrderItem :user_name="user_name"></OrderItem>
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
import AlphabetSearch from './search/AlphabetSearch.vue';

export default {
    components: {
        Master,
        MainCategory,
        MenuList,
        OrderItem,
        ButtonProcress,
        AlphabetSearch,
    },
    name: "Index",

    props: [
        'categories',
        'menu_lists',
        'category_title',
        'type',
        'category_id',
        'user_name',
        'login_time',
        'success',
    ],
}
</script>
<style>

</style>