<template>
    <div class="container-fluid">
        <div class="row py-1 d-flex justify-content-between">

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link :href="route('cashier_main_page')" class="cashier_top_btn btn btn-success btn-lg block">
                Dashboard
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link :href="route('cashier_order')" class="cashier_top_btn btn btn-success btn-lg block">
                Order
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link class="cashier_top_btn btn btn-success btn-lg block">
                Completed
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link class="cashier_top_btn btn btn-success btn-lg block">
                Customer
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link class="cashier_top_btn btn btn-success btn-lg block">
                SignOut
                </Link>
            </div>

        </div>
    </div>
</template>
<script>

export default {
    name: "TopLink",
}
</script>
<style>

</style>