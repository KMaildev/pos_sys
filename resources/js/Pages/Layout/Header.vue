<template>
    <div>
        <header id="page-topbar" style="background-color: #000000;">
            <div class="navbar-header">

                <div class="d-flex">

                    <button @click="orderConfirm()" class="top_btn">
                        Sign In : Mg Mg
                    </button>

                    <button @click="orderConfirm()" class="top_btn">
                        12/11/2022 16:05:12PM
                    </button>
                </div>

                <div class="d-flex">
                    <button @click="orderConfirm()" class="top_btn">
                        Ready for your next entry
                    </button>
                </div>
            </div>
        </header>
    </div>
</template>
<script>

export default {
    name: "Header",
}
</script>
<style>

</style>