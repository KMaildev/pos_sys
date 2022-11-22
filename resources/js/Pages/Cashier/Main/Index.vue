<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>
        </CashierMaster>
    </div>
</template>
<script>

import CashierMaster from "../../Layout/CashierMaster.vue";
import TopLink from "../Shared/TopLink.vue";

export default {
    components: {
        CashierMaster,
        TopLink,
    },
    name: "Index",

    props: [
        'user_name',
        'login_time',
    ],
}
</script>
<style>

</style>