<template>
    <div>
        <div>
            <header id="page-topbar" style="background-color: #000000;">
                <div class="navbar-header">
                    <div class="col-md-9">
                        <button class="btn btn-lg btn-default top_btn" type="button" style="background-color: #DCAE2C">
                            Sign In : Mg Mg
                        </button>

                        <button class="btn btn-lg btn-default top_btn" type="button" style="background-color: #DCAE2C">
                            Sign In : Mg Mg
                        </button>
                    </div>

                    <div class="col-md-3">
                        <button class="btn btn-lg btn-default float-end top_btn" type="button" style="background-color: #DCAE2C">
                            Ready for your next entry
                        </button>
                    </div>
                </div>
            </header>
        </div>

        <!-- <Header></Header> -->
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