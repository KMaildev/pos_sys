<template>
    <div>
        <Menu></Menu>
        <slot />
    </div>
</template>
<script>
import Menu from "./Menu";
export default {
    components: {
        Menu
    },
    name: "Master",
};
</script>
<style>

</style>