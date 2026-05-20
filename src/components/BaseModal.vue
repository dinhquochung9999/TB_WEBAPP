<template>
  <Teleport to="body">
    <Transition
      enter-active-class="transition duration-300 ease-out"
      enter-from-class="opacity-0"
      enter-to-class="opacity-100"
      leave-active-class="transition duration-200 ease-in"
      leave-from-class="opacity-100"
      leave-to-class="opacity-0"
    >
      <div
        v-if="modelValue"
        class="fixed inset-0 z-50 flex items-center justify-center px-4"
        @keydown.esc="handleEsc"
        tabindex="-1"
        ref="modalRef"
      >
        <Transition
          enter-active-class="transition duration-300 ease-out"
          enter-from-class="opacity-0"
          enter-to-class="opacity-100"
          leave-active-class="transition duration-200 ease-in"
          leave-from-class="opacity-100"
          leave-to-class="opacity-0"
        >
          <div
            v-if="modelValue"
            class="absolute inset-0 bg-black/50 backdrop-blur-sm"
            @click="handleBackdropClick"
          ></div>
        </Transition>

        <Transition
          enter-active-class="transition duration-300 ease-out"
          enter-from-class="opacity-0 scale-95 translate-y-4"
          enter-to-class="opacity-100 scale-100 translate-y-0"
          leave-active-class="transition duration-200 ease-in"
          leave-from-class="opacity-100 scale-100 translate-y-0"
          leave-to-class="opacity-0 scale-95 translate-y-4"
        >
          <div
            v-if="modelValue"
            class="relative w-full max-w-md overflow-hidden rounded-2xl bg-white shadow-2xl border border-slate-200 ring-1"
            :class="variantBorder"
          >
            <div class="flex items-start justify-between gap-4 px-6 py-5 border-b border-slate-200">
              <div class="flex items-center gap-3">
                <div
                  class="flex h-11 w-11 items-center justify-center rounded-full"
                  :class="iconWrapClass"
                >
                  <div class="h-6 w-6" v-html="iconSvg"></div>
                </div>

                <div>
                  <h3 class="text-lg font-semibold text-slate-800">
                    {{ title }}
                  </h3>
                  <p v-if="subtitle" class="text-sm text-slate-500 mt-1">
                    {{ subtitle }}
                  </p>
                </div>
              </div>

              <button
                type="button"
                class="flex h-9 w-9 items-center justify-center rounded-full text-slate-500 transition hover:bg-slate-100 hover:text-slate-700 disabled:opacity-50"
                @click="close"
                :disabled="loading"
              >
                ✕
              </button>
            </div>

            <div class="px-6 py-5">
              <slot />
            </div>

            <div class="px-6 py-4 border-t border-slate-200 bg-slate-50">
              <slot name="footer" :close="close" :confirm="handleConfirm" :loading="loading">
                <div class="flex items-center justify-end gap-3">
                  <button
                    v-if="showCancel"
                    type="button"
                    class="px-4 py-2.5 rounded-xl border border-slate-300 text-slate-700 hover:bg-slate-100 transition disabled:opacity-50 disabled:cursor-not-allowed"
                    @click="close"
                    :disabled="loading"
                  >
                    {{ cancelText }}
                  </button>

                  <button
                    v-if="showConfirm"
                    type="button"
                    class="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-xl text-white transition disabled:opacity-60 disabled:cursor-not-allowed min-w-[110px]"
                    :class="confirmButtonClass"
                    @click="handleConfirm"
                    :disabled="loading"
                  >
                    <svg
                      v-if="loading"
                      class="h-4 w-4 animate-spin"
                      viewBox="0 0 24 24"
                      fill="none"
                    >
                      <circle
                        cx="12"
                        cy="12"
                        r="10"
                        stroke="currentColor"
                        stroke-width="4"
                        class="opacity-25"
                      />
                      <path
                        d="M22 12a10 10 0 0 1-10 10"
                        stroke="currentColor"
                        stroke-width="4"
                        stroke-linecap="round"
                        class="opacity-75"
                      />
                    </svg>

                    <span>{{ loading ? loadingText : confirmText }}</span>
                  </button>
                </div>
              </slot>
            </div>
          </div>
        </Transition>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from "vue";

type Variant = "success" | "error" | "warning" | "info";

const props = defineProps({
  modelValue: {
    type: Boolean,
    default: false,
  },
  title: {
    type: String,
    default: "Thông báo",
  },
  subtitle: {
    type: String,
    default: "",
  },
  variant: {
    type: String,
    default: "info",
  },
  confirmText: {
    type: String,
    default: "Xác nhận",
  },
  cancelText: {
    type: String,
    default: "Đóng",
  },
  loadingText: {
    type: String,
    default: "Đang xử lý...",
  },
  loading: {
    type: Boolean,
    default: false,
  },
  showConfirm: {
    type: Boolean,
    default: true,
  },
  showCancel: {
    type: Boolean,
    default: true,
  },
  closeOnEsc: {
    type: Boolean,
    default: true,
  },
  closeOnBackdrop: {
    type: Boolean,
    default: true,
  },
});

const emit = defineEmits(["update:modelValue", "confirm"]);


const modalRef = ref<HTMLElement | null>(null);

const variantValue = computed(() => props.variant as Variant);

const close = () => {
  if (props.loading) return;
  emit("update:modelValue", false);
};

const handleConfirm = async () => {
  if (props.loading) return;
  emit("confirm");
};

const handleEsc = (e: KeyboardEvent) => {
  if (!props.closeOnEsc || props.loading) return;
  if (e.key === "Escape") close();
};

const handleBackdropClick = () => {
  if (!props.closeOnBackdrop || props.loading) return;
  close();
};

const iconWrapClass = computed(() => {
  switch (variantValue.value) {
    case "success":
      return "bg-emerald-100 text-emerald-600";
    case "error":
      return "bg-rose-100 text-rose-600";
    case "warning":
      return "bg-amber-100 text-amber-600";
    default:
      return "bg-blue-100 text-blue-600";
  }
});

const variantBorder = computed(() => {
  switch (variantValue.value) {
    case "success":
      return "ring-emerald-100";
    case "error":
      return "ring-rose-100";
    case "warning":
      return "ring-amber-100";
    default:
      return "ring-blue-100";
  }
});

const confirmButtonClass = computed(() => {
  switch (variantValue.value) {
    case "success":
      return "bg-emerald-600 hover:bg-emerald-700";
    case "error":
      return "bg-rose-600 hover:bg-rose-700";
    case "warning":
      return "bg-amber-600 hover:bg-amber-700";
    default:
      return "bg-blue-600 hover:bg-blue-700";
  }
});

const iconSvg = computed(() => {
  switch (variantValue.value) {
    case "success":
      return `
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="w-6 h-6">
          <circle cx="12" cy="12" r="10"></circle>
          <path d="m9 12 2 2 4-4"></path>
        </svg>
      `;
    case "error":
      return `
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="w-6 h-6">
          <circle cx="12" cy="12" r="10"></circle>
          <path d="m15 9-6 6"></path>
          <path d="m9 9 6 6"></path>
        </svg>
      `;
    case "warning":
      return `
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="w-6 h-6">
          <path d="M10.29 3.86 1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0Z"></path>
          <path d="M12 9v4"></path>
          <path d="M12 17h.01"></path>
        </svg>
      `;
    default:
      return `
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="w-6 h-6">
          <circle cx="12" cy="12" r="10"></circle>
          <path d="M12 16v-4"></path>
          <path d="M12 8h.01"></path>
        </svg>
      `;
  }
});

watch(
  () => props.modelValue,
  async (open) => {
    if (open) {
      await nextTick();
      modalRef.value?.focus();
    }
  }
);

onMounted(() => {
  window.addEventListener("keydown", handleEsc);
});

onBeforeUnmount(() => {
  window.removeEventListener("keydown", handleEsc);
});
</script>