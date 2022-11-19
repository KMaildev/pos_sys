<template>
    <div>
        <header id="page-topbar" style="background-color: #5c2b16;">
            <div class="navbar-header">

                <div class="d-flex">
                    <div class="navbar-brand-box">
                        <Link :href="route('pos_table_lists')" class="logo logo-light">
                        <span class="logo-lg">
                            <span class="logo-txt" style="font-size: 30px;">
                                LEVITATE POS
                            </span>
                        </span>
                        </Link>
                    </div>
                </div>

                <div class="d-flex">

                    <div class="main_category_btn">

                        <button class="main-category">
                            Bar & Beverage
                        </button>

                        <button class="main-category">
                            Food
                        </button>

                    </div>
                </div>
            </div>
        </header>
    </div>
</template>
<script>

export default {
    name: "Menu",

    data() {
        return {
        }
    },
}
</script>
<style>

</style>