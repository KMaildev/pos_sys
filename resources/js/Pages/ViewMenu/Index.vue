<template>
    <master :user_name="user_name" :login_time="login_time">
        <div class="row">
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
        'user_name',
    ],
}
</script>
<style>

</style>