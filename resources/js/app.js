import './bootstrap'
import Vue from 'vue'
import { createInertiaApp, Link } from '@inertiajs/inertia-vue'
createInertiaApp({
    resolve: name => require(`./Pages/${name}`),
    setup({ el, App, props, plugin }) {
        Vue.use(plugin)
        Vue.component('Link', Link)
        new Vue({
            render: h => h(App, props),
        }).$mount(el)
    },
})