import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import { i18n } from "./locales";
import Toast from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import "./style.css";

createApp(App)
    .use(router)
    .use(i18n)
    .use(Toast)
    .mount("#app");