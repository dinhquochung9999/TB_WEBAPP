<template>
  <div class="min-h-screen bg-slate-100 dark:bg-slate-950 flex transition-colors">
    <AppSidebar :open="sidebarOpen" :collapsed="sidebarCollapsed" @close="sidebarOpen = false" />

    <div :class="['flex-1 flex flex-col min-w-0', sidebarCollapsed ? 'md:pl-20' : 'md:pl-72']">
      <AppNavbar 
        @toggle-sidebar="sidebarOpen = !sidebarOpen" 
        @toggle-collapse="sidebarCollapsed = !sidebarCollapsed"
        :dark-mode="darkMode"
        @toggle-dark-mode="toggleDarkMode"
      />

      <main class="flex-1 p-4 md:p-6 overflow-auto pb-14">
        <RouterView />
      </main>

      <AppFooter />
    </div>

    <div v-if="sidebarOpen" class="fixed inset-0 bg-black/40 z-30 md:hidden" @click="sidebarOpen = false"></div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, watch } from "vue";
import AppSidebar from "../components/AppSidebar.vue";
import AppNavbar from "../components/AppNavbar.vue";
import AppFooter from "../components/AppFooter.vue";

const sidebarOpen = ref(false);
const sidebarCollapsed = ref(false);
const darkMode = ref(false);

const toggleDarkMode = () => {
  darkMode.value = !darkMode.value;
};

const applyDarkMode = (isDark: boolean) => {
  const html = document.documentElement;
  if (isDark) {
    html.classList.add("dark");
  } else {
    html.classList.remove("dark");
  }
  localStorage.setItem("darkMode", JSON.stringify(isDark));
};

watch(darkMode, (newValue) => {
  applyDarkMode(newValue);
});

onMounted(() => {
  // Load dark mode preference from localStorage
  const savedDarkMode = localStorage.getItem("darkMode");
  if (savedDarkMode !== null) {
    darkMode.value = JSON.parse(savedDarkMode);
  }
  // Apply the loaded preference
  applyDarkMode(darkMode.value);
});
</script>