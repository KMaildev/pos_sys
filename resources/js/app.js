import './bootstrap'
import Vue from 'vue'
import { createInertiaApp, Link } from '@inertiajs/inertia-vue'
import VueToastr from "vue-toastr";


createInertiaApp({
    resolve: name => require(`./Pages/${name}`),

    setup({ el, App, props, plugin }) {
        Vue.use(plugin);
        Vue.use(VueToastr);
        Vue.mixin(
            {
                methods: {
                    route: window.route
                },
            }
        );
        Vue.component('Link', Link)

        new Vue({
            data() {
                return {
                    cart: [],
                }
            },
            render: h => h(App, props),
        }).$mount(el)
    },
})