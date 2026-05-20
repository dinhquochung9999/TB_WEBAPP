<template>
  <aside :class="[
    'fixed md:fixed inset-y-0 left-0 z-40 bg-slate-900 dark:bg-slate-950 text-white',
    'transform transition-all duration-300 md:translate-x-0 flex flex-col shadow-2xl',
    open ? 'translate-x-0' : '-translate-x-full md:translate-x-0',
    collapsed ? 'md:w-20' : 'w-72 md:w-72'
  ]">
    <!-- Header -->
    <div class="h-16 flex items-center justify-between px-5 border-b border-white/10 flex-shrink-0">
      <div v-if="!collapsed" class="flex items-center gap-3">
        <div class="w-10 h-10 rounded-xl bg-blue-600 flex items-center justify-center font-bold animate-pulse">
          M
        </div>

        <div>
          <h1 class="font-bold text-lg leading-none">V I P</h1>
        </div>
      </div>

      <div v-else class="flex-1 flex items-center justify-center">
        <div class="w-10 h-10 rounded-xl bg-blue-600 flex items-center justify-center font-bold animate-pulse">
          M
        </div>
      </div>

      <button class="md:hidden text-white/70 hover:text-white transition" @click="$emit('close')">
        <X class="w-5 h-5" />
      </button>
    </div>

    <!-- Menu -->
    <nav class="flex-1 overflow-y-auto p-4 space-y-2">
      <!-- Home -->
      <RouterLink to="/" class="menu-item" active-class="menu-active" exact-active-class="menu-active"
        @click="$emit('close')">
        <House class="w-5 h-5 flex-shrink-0 transition-transform group-hover:scale-110" />
        <span v-if="!collapsed" class="transition-opacity">{{ t('sidebar.home') }}</span>
      </RouterLink>

      <!-- Embedded App -->
      <RouterLink to="/app" class="menu-item" active-class="menu-active" @click="$emit('close')">
        <AppWindow class="w-5 h-5 flex-shrink-0 transition-transform group-hover:scale-110" />
        <span v-if="!collapsed" class="transition-opacity">{{ t('sidebar.app') || 'App' }}</span>
      </RouterLink>

      <!-- External App -->
      <RouterLink to="/external" class="menu-item" active-class="menu-active" @click="$emit('close')">
        <Globe class="w-5 h-5 flex-shrink-0 transition-transform group-hover:scale-110" />
        <span v-if="!collapsed" class="transition-opacity">{{ t('sidebar.externalApp') || 'External App' }}</span>
      </RouterLink>

      <!-- Another App -->
      <RouterLink to="/another" class="menu-item" active-class="menu-active" @click="$emit('close')">
        <Zap class="w-5 h-5 flex-shrink-0 transition-transform group-hover:scale-110" />
        <span v-if="!collapsed" class="transition-opacity">{{ t('sidebar.anotherApp') || 'Another App' }}</span>
      </RouterLink>

    </nav>
  </aside>
</template>

<script setup lang="ts">
import { useI18n } from "vue-i18n";
import {
  House,
  X,
  AppWindow,
  Globe,
  Zap,
} from "lucide-vue-next";

const { t } = useI18n();

defineProps<{
  open: boolean;
  collapsed?: boolean;
}>();

defineEmits<{
  (e: "close"): void;
}>();
</script>

<style scoped>
.menu-item {
  @apply flex items-center gap-3 px-4 py-3 rounded-xl text-white/80 hover:text-white hover:bg-white/10 transition-all duration-200;
}

.menu-active {
  @apply bg-blue-600 text-white shadow-lg;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

@keyframes slideInFromTop {
  from {
    transform: translateY(-10px);
    opacity: 0;
  }

  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.animate-in {
  animation: fadeIn 0.2s ease-in-out;
}

.fade-in {
  animation: fadeIn 0.2s ease-in-out;
}

.slide-in-from-top-2 {
  animation: slideInFromTop 0.2s ease-in-out;
}
</style>