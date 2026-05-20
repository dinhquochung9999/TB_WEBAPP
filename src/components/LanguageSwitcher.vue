<template>
  <div class="flex items-center gap-1 bg-slate-100 dark:bg-slate-800 p-1 rounded-lg">
    <button v-for="lang in langs" :key="lang.value" @click="changeLang(lang.value)"
      class="px-2.5 py-1.5 rounded text-xs font-medium border transition-all"
      :class="locale === lang.value
        ? 'bg-blue-600 text-white border-blue-600 shadow-md'
        : 'bg-transparent text-slate-700 dark:text-slate-300 border-transparent hover:bg-slate-200 dark:hover:bg-slate-700'">
      {{ lang.label }}
    </button>
  </div>
</template>

<script setup lang="ts">
import { useI18n } from "vue-i18n";

const { locale } = useI18n();

const langs = [
  { value: "vi", label: "VI" },
  { value: "en", label: "EN" },
  { value: "zh", label: "中文" },
];

const changeLang = (lang: string) => {
  locale.value = lang;
  localStorage.setItem("locale", lang);
};
</script>