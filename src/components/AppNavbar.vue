<template>
    <header
        class="h-16 bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-700 flex items-center justify-between px-4 md:px-6 sticky top-0 z-20 transition-colors">
        <div class="flex items-center gap-3">
            <button
                class="md:hidden w-10 h-10 rounded-xl border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-800 transition flex items-center justify-center text-slate-600 dark:text-slate-300"
                @click="$emit('toggle-sidebar')">
                ☰
            </button>

            <button
                class="hidden md:flex w-10 h-10 rounded-xl border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-800 transition items-center justify-center"
                @click="$emit('toggle-collapse')" title="Toggle sidebar">
                <ChevronLeft v-if="!sidebarCollapsed" class="w-5 h-5 text-slate-600 dark:text-slate-300" />
                <ChevronRight v-else class="w-5 h-5 text-slate-600 dark:text-slate-300" />
            </button> 
        </div>

        <div class="flex items-center gap-4">
            <button
                class="w-10 h-10 rounded-xl border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center justify-center transition"
                @click="$emit('toggle-dark-mode')" :title="darkMode ? 'Light mode' : 'Dark mode'">
                <Moon v-if="!darkMode" class="w-5 h-5 text-slate-600 dark:text-slate-300" />
                <Sun v-else class="w-5 h-5 text-yellow-500" />
            </button>

            <LanguageSwitcher />

            <!-- User Profile Card Dropdown -->
            <div class="relative">
                <button
                    class="flex items-center gap-2 px-2 py-1.5 rounded-xl hover:bg-slate-100 dark:hover:bg-slate-800 transition"
                    @click="profileOpen = !profileOpen">
                    <div
                        class="w-9 h-9 rounded-full bg-blue-600 text-white flex items-center justify-center font-semibold">
                        A
                    </div>
                    <div class="hidden sm:block">
                        <div class="text-sm font-medium text-slate-800 dark:text-white">Admin</div>
                    </div>
                    <ChevronDown class="w-4 h-4 text-slate-600 dark:text-slate-300" />
                </button>

                <!-- Profile Dropdown -->
                <div v-if="profileOpen"
                    class="absolute right-0 mt-2 w-56 bg-white dark:bg-slate-800 rounded-xl shadow-lg border border-slate-200 dark:border-slate-700 overflow-hidden z-50">
                    <!-- Profile Card Header -->
                    <div class="p-4 bg-gradient-to-r from-blue-600 to-blue-700">
                        <div
                            class="w-12 h-12 rounded-full bg-white text-blue-600 flex items-center justify-center font-bold mb-2">
                            A
                        </div>
                        <h3 class="text-white font-semibold">Admin User</h3> 
                    </div>
 
                    <div class="p-2 border-t border-slate-200 dark:border-slate-700"> 
                        <button
                            class="w-full text-left px-4 py-2 rounded-lg text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-700 transition flex items-center gap-2">
                            <LogOut class="w-4 h-4" />
                            <span>{{ t('nav.logout') }}</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </header>
</template>

<script setup lang="ts">
import { useI18n } from "vue-i18n";
import { ref } from "vue";
import { ChevronLeft, ChevronRight, ChevronDown, LogOut, Sun, Moon } from "lucide-vue-next";
import LanguageSwitcher from "./LanguageSwitcher.vue";

const { t } = useI18n();
const profileOpen = ref(false);

defineProps<{
    sidebarCollapsed?: boolean;
    darkMode?: boolean;
}>();

defineEmits<{
    (e: "toggle-sidebar"): void;
    (e: "toggle-collapse"): void;
    (e: "toggle-dark-mode"): void;
}>();
</script>

<style scoped></style>