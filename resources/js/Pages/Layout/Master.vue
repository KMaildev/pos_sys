<template>
    <div>
        <Header></Header>
        <slot />
    </div>
</template>
<script>
import Header from "./Header";
export default {
    name: "Master",
    components: {
        Header
    },
};
</script>
<style>

</style>