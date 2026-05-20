<template>
  <section class="max-w-md mx-auto px-4 py-10">
    <div class="bg-white rounded-2xl shadow p-8">
      <h1 class="text-3xl font-bold mb-6 text-center">
        {{ t("login.title") }}
      </h1>

      <form class="space-y-4" @submit.prevent="handleLogin">
        <div>
          <label class="block mb-2 text-sm font-medium">
            {{ t("login.email") }}
          </label>
          <input v-model="email" type="email"
            class="w-full px-4 py-3 border rounded-xl outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="name@example.com" />
        </div>

        <div>
          <label class="block mb-2 text-sm font-medium">
            {{ t("login.password") }}
          </label>
          <input v-model="password" type="password"
            class="w-full px-4 py-3 border rounded-xl outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="••••••••" />
        </div>

        <button type="submit"
          class="w-full px-4 py-3 rounded-xl bg-blue-600 text-white hover:bg-blue-700 transition disabled:opacity-60"
          :disabled="loading">
          {{ loading ? "Đang xử lý..." : t("login.button") }}
        </button>
      </form>
    </div>

    <BaseModal v-model="showSuccessModal" title="Đăng nhập thành công" subtitle="Tài khoản đã được xác thực"
      variant="success" :loading="loading" confirmText="OK" cancelText="Đóng" @confirm="showSuccessModal = false">
      <p class="text-slate-600 leading-6">
        Chào mừng bạn quay lại hệ thống. Bạn có thể tiếp tục sử dụng ứng dụng.
      </p>

      <template #footer="{ close, confirm, loading }">
        <div class="flex items-center justify-end gap-3">
          <button type="button"
            class="px-4 py-2.5 rounded-xl border border-slate-300 text-slate-700 hover:bg-slate-100 transition disabled:opacity-50"
            @click="close" :disabled="loading">
            Hủy
          </button>

          <button type="button"
            class="px-4 py-2.5 rounded-xl bg-emerald-600 text-white hover:bg-emerald-700 transition inline-flex items-center gap-2 disabled:opacity-50"
            @click="confirm" :disabled="loading">
            <svg v-if="loading" class="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
              <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" class="opacity-25" />
              <path d="M22 12a10 10 0 0 1-10 10" stroke="currentColor" stroke-width="4" stroke-linecap="round"
                class="opacity-75" />
            </svg>
            <span>{{ loading ? "Đang xử lý..." : "Xác nhận" }}</span>
          </button>
        </div>
      </template>
    </BaseModal>

    <BaseModal v-model="showErrorModal" title="Thiếu thông tin" subtitle="Vui lòng kiểm tra lại" variant="error"
      confirmText="Đã hiểu" cancelText="Đóng" @confirm="showErrorModal = false">
      <p class="text-slate-600 leading-6">
        Email và mật khẩu không được để trống.
      </p>
    </BaseModal>
  </section>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { useI18n } from "vue-i18n";
import BaseModal from "../components/BaseModal.vue";

const { t } = useI18n();

const email = ref("");
const password = ref("");
const loading = ref(false);

const showSuccessModal = ref(false);
const showErrorModal = ref(false);

const handleLogin = async () => {
  if (!email.value || !password.value) {
    showErrorModal.value = true;
    return;
  }

  loading.value = true;

  try {
    await new Promise((resolve) => setTimeout(resolve, 1500));
    showSuccessModal.value = true;
  } finally {
    loading.value = false;
  }
};
</script>