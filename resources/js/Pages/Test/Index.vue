<template>
    <master>
        Test Page

        <Link href="/pos_table_lists" class="main-category">
        Table
        </Link>

        <Link href="/pos_test_page" class="main-category">
        Test
        </Link>
    </master>
</template>
<script>

import Master from "../Layout/Master";

export default {
    components: {
        Master
    },
    name: "Test",
}
</script>
<style>

</style>