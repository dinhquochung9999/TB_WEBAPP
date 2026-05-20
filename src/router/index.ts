import { createRouter, createWebHistory } from "vue-router";
import MainLayout from "../layouts/MainLayout.vue";
import HomeView from "../views/HomeView.vue";
import LoginView from "../views/LoginView.vue";
import EmbeddedAppView from "../views/EmbeddedAppView.vue";
import ExternalAppView from "../views/ExternalAppView.vue";
import AnotherAppView from "../views/AnotherAppView.vue";
import ProfileView from "../views/ProfileView.vue";
import SettingsView from "../views/SettingsView.vue";

const routes = [
    {
        path: "/",
        component: MainLayout,
        children: [
            {
                path: "",
                name: "home",
                component: HomeView,
            },
            {
                path: "app",
                name: "embedded-app",
                component: EmbeddedAppView,
            },
            {
                path: "external",
                name: "external-app",
                component: ExternalAppView,
            },
            {
                path: "another",
                name: "another-app",
                component: AnotherAppView,
            },
            {
                path: "profile",
                name: "profile",
                component: ProfileView,
            },
            {
                path: "settings",
                name: "settings",
                component: SettingsView,
            },
        ],
    },
    {
        path: "/login",
        name: "login",
        component: LoginView,
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;