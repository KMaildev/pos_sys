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
                                    {{ $inertia.page.props.department }}
                                </span>
                            </p>
                        </div>
                    </div>

                    <div class="main-box">
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

                    <!-- Waiter  -->
                    <ul class="metismenu list-unstyled d-flex align-items-end flex-column"
                        v-if="$inertia.page.props.department === 'waiter'">

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('pos_table_lists')" class="btn btn-default menubtn"
                                :class="currentRoute == 'pos_table_lists' ? 'bg_color' : ''">
                            <i class="fa fa-table text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Reservation
                            </Link>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('view_pos_menu')" class="btn btn-default menubtn"
                                :class="currentRoute == 'view_pos_menu' ? 'bg_color' : ''">
                            <i class="fa fa-kitchen-set text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            View Menu
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

                    <!-- Cashier  -->
                    <ul class="metismenu list-unstyled d-flex align-items-end flex-column"
                        v-if="$inertia.page.props.department === 'cashier'">
                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('pos_table_lists')" class="btn btn-default menubtn"
                                :class="currentRoute == 'pos_table_lists' ? 'bg_color' : ''">
                            <i class="fa fa-table text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Reservation
                            </Link>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('view_pos_menu')" class="btn btn-default menubtn"
                                :class="currentRoute == 'view_pos_menu' ? 'bg_color' : ''">
                            <i class="fa fa-kitchen-set text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            View Menu
                            </Link>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('bill_table_lists')" class="btn btn-default menubtn"
                                :class="currentRoute == 'bill_table_lists' ? 'bg_color' : ''">
                            <i class="fa-solid fa-dollar-sign text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Bill
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

                    <!-- Admin HR  -->
                    <ul class="metismenu list-unstyled d-flex align-items-end flex-column"
                        v-if="$inertia.page.props.department === 'admin' || $inertia.page.props.department === 'manager'">
                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('pos_table_lists')" class="btn btn-default menubtn"
                                :class="currentRoute == 'pos_table_lists' ? 'bg_color' : ''">
                            <i class="fa fa-table text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Reservation
                            </Link>
                        </li>


                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('view_pos_menu')" class="btn btn-default menubtn"
                                :class="currentRoute == 'view_pos_menu' ? 'bg_color' : ''">
                            <i class="fa fa-kitchen-set text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            View Menu
                            </Link>
                        </li>

                        <li style="width: 90%; margin-bottom: 10px;">
                            <a @click="linkMenu()" class="btn btn-default menubtn"
                                :class="currentRoute == 'pos_menu' ? 'bg_color' : ''">
                                <i class="fa fa-kitchen-set text-white" style="font-size: 23px;"></i>
                                &nbsp;&nbsp;&nbsp;
                                Order Menu
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

                        <li style="width: 90%; margin-bottom: 10px;">
                            <Link :href="route('manager_void_item')" class="btn btn-default menubtn">
                            <i class="fa fa-list text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Void Items
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


        callVoidItemTotal() {
            axios.get(`/pos_void_item_count`)
                .then(response => (this.notification(response.data.void_item_total)));
        },

        notification(void_item_total) {
            if (void_item_total != 0) {
                if (Notification?.permission === "granted") {
                    const greeting = new Notification('Void Notification', {
                        tag: "soManyNotification"
                    });
                }
            }
        },
    },

    mounted: function () {
        window.setInterval(() => {
            this.callVoidItemTotal()
        }, 10000) //10 Seconds
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
    font-family: georgia !important;
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