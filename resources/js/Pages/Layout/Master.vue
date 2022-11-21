<template>
    <div>
        <div>
            <header id="page-topbar" style="background-color: #000000;">
                <div class="navbar-header">
                    <div class="col-md-9">
                        <button class="btn btn-lg btn-default top_btn" type="button" style="background-color: #DCAE2C">
                            Sign In : {{ user_name }}
                        </button>

                        <button class="btn btn-lg btn-default top_btn" type="button" style="background-color: #DCAE2C">
                            {{ login_time }}
                        </button>
                    </div>

                    <div class="col-md-3">
                        <button class="btn btn-lg btn-default float-end top_btn" type="button"
                            style="background-color: #DCAE2C">
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

    props: [
        'user_name',
        'login_time',
    ],
};
</script>
<style>

</style>