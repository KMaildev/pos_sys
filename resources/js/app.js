import './bootstrap'
import Vue from 'vue'
import { createInertiaApp, Link } from '@inertiajs/inertia-vue'

createInertiaApp({
    resolve: name => require(`./Pages/${name}`),
    setup({ el, App, props, plugin }) {
        Vue.use(plugin)
        Vue.mixin({ methods: { route: window.route } });
        Vue.component('Link', Link)
        new Vue({
            render: h => h(App, props),
        }).$mount(el)
    },
})