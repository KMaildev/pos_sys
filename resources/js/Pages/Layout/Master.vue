<template>
    <div>
        <header id="page-topbar" style="background-color: #000000;">
            <div class="navbar-header">
                <div class="d-flex">
                    <div class="navbar-brand-box" style="background-color: black;">
                        <span class="logo-lg">
                            <img :src="'/data/logo/dark_logo.jpeg'" style="width: 98%;">
                        </span>
                    </div>
                </div>

                <div class="d-flex">
                    <div class="main-box">
                        <div style="background-color: #000000;">
                            <p style="text-align: left;" class="name-text">
                                Name:
                                <span style="float: right;">
                                    {{ user_name }}
                                </span>
                            </p>

                            <p class="position-text" style="text-align: left;">
                                Position:
                                <span style="float: right;">
                                    {{ $inertia.page.props.position }}
                                </span>
                            </p>
                        </div>
                    </div>

                    <div class="main-box" >
                        <div style="background-color: #000000;">
                            <p style="text-align: left;" class="name-text">
                                Date:
                                <span style="float: right;">
                                    {{ currentDate }}
                                </span>
                            </p>
                            <p class="position-text" style="text-align: left;">
                                Time:
                                <span style="float: right;">
                                    {{ currentTime }}
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="vertical-menu py-5" style="background-color: #333333;">
            <div data-simplebar class="h-100">
                <div id="sidebar-menu">
                    <ul class="metismenu list-unstyled d-flex align-items-end flex-column" id="side-menu">

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('pos_table_lists')" class="btn btn-default menubtn"
                                :class="currentRoute == 'pos_table_lists' ? 'bg_color' : ''">
                            <i class="fa fa-table text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Reservation
                            </Link>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <a @click="linkMenu()" class="btn btn-default menubtn"
                                :class="currentRoute == 'pos_menu' ? 'bg_color' : ''">
                                <i class="fa fa-kitchen-set text-white" style="font-size: 23px;"></i>
                                &nbsp;&nbsp;&nbsp;
                                Menu
                            </a>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('bill_table_lists')" class="btn btn-default menubtn"
                                :class="currentRoute == 'bill_table_lists' ? 'bg_color' : ''">
                            <i class="fa-solid fa-dollar-sign text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Bill
                            </Link>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('pos_sale_report')" class="btn btn-default menubtn">
                            <i class="fa fa-chart-line text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Report
                            </Link>
                        </li>

                        <li style="width: 90%;">
                            <div class="d-flex align-items-end" style="height: 100px;">
                                <div class="mt-auto" style="width: 100%">
                                    <a href="/pos_pin_logout" class="btn btn-default menubtn">
                                        <i class="fa-solid fa-lock text-white" style="font-size: 23px;"></i>
                                        &nbsp;&nbsp;&nbsp;
                                        Sign Out
                                    </a>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <slot />
                </div>
            </div>
        </div>

    </div>
</template>
<script>
export default {
    name: "Master",
    props: [
        'user_name',
        'success',
    ],
    data() {
        return {
            currentRoute: route().current(),
            currentDate: new Date().toISOString().slice(0, 10),
            currentTime: '',
        }
    },
    methods: {
        linkMenu() {
            let type = 'Beverage';
            this.$inertia.get(`/pos_menu?type=${type}`);
        },
    },

    created() {
        var date = new Date();
        this.currentTime = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

        if (this.$inertia.page.props.success) {
            this.$toastr.s(
                this.$inertia.page.props.success
            );
        }

        if (this.$inertia.page.props.error) {
            this.$toastr.e(
                this.$inertia.page.props.error
            );
        }

    }

};
</script>
<style>
.menubtn {
    width: 100%;
    background-color: #717171;
    color: white !important;
    text-align: left;
    font-size: 18px !important;
    font-weight: bold;
    border-radius: 20px 0px 0px 20px;
}

.menubtn:hover {
    width: 100%;
    background-color: #717171;
    color: white !important;
    text-align: left;
    font-size: 18px !important;
    font-weight: bold;
    border-radius: 20px 0px 0px 20px;
}

.bg_color {
    background-color: #4D4D4D;
}

.bg_color:hover {
    background-color: #4D4D4D;
}

.main-box {
    width: 250px;
    height: auto;
    display: flex;
    flex-wrap: wrap;
    align-content: center;
}

.main-box div {
    width: 250px;
    height: 70px;
}

.name-text {
    font-size: 18px;
    color: white;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 7px;
    margin: 0px;
    font-weight: bold;
}

.position-text {
    font-size: 18px;
    color: white;
    padding-left: 10px;
    padding-right: 10px;
    margin: 0px;
    font-weight: bold;
}
</style>