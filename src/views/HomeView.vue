<template>
  <div class="space-y-6">
    <!-- Header Section -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <!-- Welcome Card -->
      <div class="bg-gradient-to-br from-blue-600 to-blue-700 rounded-2xl shadow-lg p-8 text-white">
        <h1 class="text-3xl font-bold mb-2">{{ t('home.title') }}</h1>
        <p class="text-blue-100 mb-4">{{ t('home.subtitle') }}</p>
        <div class="flex items-center gap-2 text-blue-200">
          <span class="w-3 h-3 rounded-full bg-green-400 animate-pulse"></span>
          <span>{{ t('home.systemStatus') }}</span>
        </div>
      </div>

      <!-- Quick Stats Summary -->
      <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-lg p-8">
        <h2 class="text-lg font-semibold text-slate-800 dark:text-white mb-4">{{ t('home.todaySummary') }}</h2>
        <div class="space-y-3">
          <div class="flex justify-between items-center">
            <span class="text-slate-600 dark:text-slate-300">{{ t('home.productionUnits') }}</span>
            <span class="text-2xl font-bold text-blue-600">2,450</span>
          </div>
          <div class="flex justify-between items-center">
            <span class="text-slate-600 dark:text-slate-300">{{ t('home.ordersCompleted') }}</span>
            <span class="text-2xl font-bold text-green-600">45</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Key Performance Indicators -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
      <!-- Total Sales -->
      <div class="bg-white dark:bg-slate-800 rounded-xl shadow p-6 border-l-4 border-blue-600">
        <div class="flex items-center justify-between mb-2">
          <h3 class="text-slate-600 dark:text-slate-400 text-sm font-semibold">{{ t('home.totalSales') }}</h3>
          <DollarSign class="w-5 h-5 text-blue-600" />
        </div>
        <p class="text-3xl font-bold text-slate-800 dark:text-white">$245.8K</p>
        <p class="text-green-600 text-sm mt-2">+12.5% {{ t('home.fromLastMonth') }}</p>
      </div>

      <!-- Production Output -->
      <div class="bg-white dark:bg-slate-800 rounded-xl shadow p-6 border-l-4 border-purple-600">
        <div class="flex items-center justify-between mb-2">
          <h3 class="text-slate-600 dark:text-slate-400 text-sm font-semibold">{{ t('home.productionOutput') }}</h3>
          <Package class="w-5 h-5 text-purple-600" />
        </div>
        <p class="text-3xl font-bold text-slate-800 dark:text-white">12.5K</p>
        <p class="text-green-600 text-sm mt-2">+8.2% {{ t('home.unitsPerDay') }}</p>
      </div>

      <!-- Inventory Level -->
      <div class="bg-white dark:bg-slate-800 rounded-xl shadow p-6 border-l-4 border-orange-600">
        <div class="flex items-center justify-between mb-2">
          <h3 class="text-slate-600 dark:text-slate-400 text-sm font-semibold">{{ t('home.inventoryLevel') }}</h3>
          <Layers class="w-5 h-5 text-orange-600" />
        </div>
        <p class="text-3xl font-bold text-slate-800 dark:text-white">45.2K</p>
        <p class="text-yellow-600 text-sm mt-2">85% {{ t('home.capacity') }}</p>
      </div>

      <!-- Order Status -->
      <div class="bg-white dark:bg-slate-800 rounded-xl shadow p-6 border-l-4 border-green-600">
        <div class="flex items-center justify-between mb-2">
          <h3 class="text-slate-600 dark:text-slate-400 text-sm font-semibold">{{ t('home.pendingOrders') }}</h3>
          <ShoppingCart class="w-5 h-5 text-green-600" />
        </div>
        <p class="text-3xl font-bold text-slate-800 dark:text-white">328</p>
        <p class="text-orange-600 text-sm mt-2">{{ t('home.avgDeliveryDays') }}</p>
      </div>
    </div>

    <!-- Charts Section -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
      <!-- Sales Chart -->
      <div class="lg:col-span-2 bg-white dark:bg-slate-800 rounded-2xl shadow p-6">
        <h3 class="text-lg font-semibold text-slate-800 dark:text-white mb-4">{{ t('home.salesPerformance') }}</h3>
        <div class="h-64 flex items-end justify-around gap-2 px-4">
          <div class="flex flex-col items-center gap-2">
            <div class="w-12 bg-blue-500 rounded-t" style="height: 45%"></div>
            <span class="text-xs text-slate-600 dark:text-slate-400">Jan</span>
          </div>
          <div class="flex flex-col items-center gap-2">
            <div class="w-12 bg-blue-500 rounded-t" style="height: 62%"></div>
            <span class="text-xs text-slate-600 dark:text-slate-400">Feb</span>
          </div>
          <div class="flex flex-col items-center gap-2">
            <div class="w-12 bg-blue-600 rounded-t" style="height: 78%"></div>
            <span class="text-xs text-slate-600 dark:text-slate-400">Mar</span>
          </div>
          <div class="flex flex-col items-center gap-2">
            <div class="w-12 bg-blue-600 rounded-t" style="height: 85%"></div>
            <span class="text-xs text-slate-600 dark:text-slate-400">Apr</span>
          </div>
          <div class="flex flex-col items-center gap-2">
            <div class="w-12 bg-blue-600 rounded-t" style="height: 72%"></div>
            <span class="text-xs text-slate-600 dark:text-slate-400">May</span>
          </div>
        </div>
      </div>

      <!-- Production Status -->
      <div class="bg-white dark:bg-slate-800 rounded-2xl shadow p-6">
        <h3 class="text-lg font-semibold text-slate-800 dark:text-white mb-4">{{ t('home.productionStatus') }}</h3>
        <div class="space-y-4">
          <div>
            <div class="flex justify-between mb-2">
              <span class="text-sm text-slate-600 dark:text-slate-400">{{ t('home.runningModels') }}</span>
              <span class="text-sm font-semibold text-slate-800 dark:text-white">78%</span>
            </div>
            <div class="w-full bg-slate-200 dark:bg-slate-700 rounded-full h-2">
              <div class="bg-green-500 h-2 rounded-full" style="width: 78%"></div>
            </div>
          </div>
          <div>
            <div class="flex justify-between mb-2">
              <span class="text-sm text-slate-600 dark:text-slate-400">{{ t('home.maintenance') }}</span>
              <span class="text-sm font-semibold text-slate-800 dark:text-white">12%</span>
            </div>
            <div class="w-full bg-slate-200 dark:bg-slate-700 rounded-full h-2">
              <div class="bg-yellow-500 h-2 rounded-full" style="width: 12%"></div>
            </div>
          </div>
          <div>
            <div class="flex justify-between mb-2">
              <span class="text-sm text-slate-600 dark:text-slate-400">{{ t('home.downtime') }}</span>
              <span class="text-sm font-semibold text-slate-800 dark:text-white">10%</span>
            </div>
            <div class="w-full bg-slate-200 dark:bg-slate-700 rounded-full h-2">
              <div class="bg-red-500 h-2 rounded-full" style="width: 10%"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Recent Orders & Activities -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <!-- Recent Orders -->
      <div class="bg-white dark:bg-slate-800 rounded-2xl shadow overflow-hidden">
        <div class="p-6 border-b border-slate-200 dark:border-slate-700">
          <h3 class="text-lg font-semibold text-slate-800 dark:text-white">{{ t('home.recentOrders') }}</h3>
        </div>
        <div class="divide-y divide-slate-200 dark:divide-slate-700">
          <div class="p-4 hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div class="flex items-center justify-between mb-2">
              <span class="font-semibold text-slate-800 dark:text-white">Order #ORD-2024-001</span>
              <span class="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">{{ t('home.shipped') }}</span>
            </div>
            <p class="text-sm text-slate-600 dark:text-slate-400">HOKA Clifton 9 - 500 {{ t('home.units') }}</p>
          </div>
          <div class="p-4 hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div class="flex items-center justify-between mb-2">
              <span class="font-semibold text-slate-800 dark:text-white">Order #ORD-2024-002</span>
              <span class="text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded-full">{{ t('home.inProgress') }}</span>
            </div>
            <p class="text-sm text-slate-600 dark:text-slate-400">HOKA Mach 5 - 750 {{ t('home.units') }}</p>
          </div>
          <div class="p-4 hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div class="flex items-center justify-between mb-2">
              <span class="font-semibold text-slate-800 dark:text-white">Order #ORD-2024-003</span>
              <span class="text-xs bg-yellow-100 text-yellow-700 px-2 py-1 rounded-full">{{ t('home.pending') }}</span>
            </div>
            <p class="text-sm text-slate-600 dark:text-slate-400">HOKA Bondi 8 - 600 {{ t('home.units') }}</p>
          </div>
          <div class="p-4 hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div class="flex items-center justify-between mb-2">
              <span class="font-semibold text-slate-800 dark:text-white">Order #ORD-2024-004</span>
              <span class="text-xs bg-purple-100 text-purple-700 px-2 py-1 rounded-full">{{ t('home.processing') }}</span>
            </div>
            <p class="text-sm text-slate-600 dark:text-slate-400">HOKA Gaviota 4 - 450 {{ t('home.units') }}</p>
          </div>
        </div>
      </div>

      <!-- Inventory by Product -->
      <div class="bg-white dark:bg-slate-800 rounded-2xl shadow overflow-hidden">
        <div class="p-6 border-b border-slate-200 dark:border-slate-700">
          <h3 class="text-lg font-semibold text-slate-800 dark:text-white">{{ t('home.inventoryByProduct') }}</h3>
        </div>
        <div class="divide-y divide-slate-200 dark:divide-slate-700">
          <div class="p-4 flex items-center justify-between hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div>
              <p class="font-semibold text-slate-800 dark:text-white">Clifton 9</p>
              <p class="text-sm text-slate-600 dark:text-slate-400">8,500 {{ t('home.units') }}</p>
            </div>
            <div class="text-right">
              <div class="text-xl font-bold text-slate-800 dark:text-white">18%</div>
              <div class="w-16 h-2 bg-slate-200 dark:bg-slate-700 rounded-full mt-1">
                <div class="bg-blue-600 h-2 rounded-full" style="width: 65%"></div>
              </div>
            </div>
          </div>
          <div class="p-4 flex items-center justify-between hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div>
              <p class="font-semibold text-slate-800 dark:text-white">Mach 5</p>
              <p class="text-sm text-slate-600 dark:text-slate-400">12,300 {{ t('home.units') }}</p>
            </div>
            <div class="text-right">
              <div class="text-xl font-bold text-slate-800 dark:text-white">27%</div>
              <div class="w-16 h-2 bg-slate-200 dark:bg-slate-700 rounded-full mt-1">
                <div class="bg-green-600 h-2 rounded-full" style="width: 78%"></div>
              </div>
            </div>
          </div>
          <div class="p-4 flex items-center justify-between hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div>
              <p class="font-semibold text-slate-800 dark:text-white">Bondi 8</p>
              <p class="text-sm text-slate-600 dark:text-slate-400">9,200 {{ t('home.units') }}</p>
            </div>
            <div class="text-right">
              <div class="text-xl font-bold text-slate-800 dark:text-white">20%</div>
              <div class="w-16 h-2 bg-slate-200 dark:bg-slate-700 rounded-full mt-1">
                <div class="bg-purple-600 h-2 rounded-full" style="width: 72%"></div>
              </div>
            </div>
          </div>
          <div class="p-4 flex items-center justify-between hover:bg-slate-50 dark:hover:bg-slate-700 transition">
            <div>
              <p class="font-semibold text-slate-800 dark:text-white">Gaviota 4</p>
              <p class="text-sm text-slate-600 dark:text-slate-400">15,200 {{ t('home.units') }}</p>
            </div>
            <div class="text-right">
              <div class="text-xl font-bold text-slate-800 dark:text-white">35%</div>
              <div class="w-16 h-2 bg-slate-200 dark:bg-slate-700 rounded-full mt-1">
                <div class="bg-orange-600 h-2 rounded-full" style="width: 85%"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Quick Actions -->
    <div class="bg-white dark:bg-slate-800 rounded-2xl shadow p-6">
      <h3 class="text-lg font-semibold text-slate-800 dark:text-white mb-4">{{ t('home.quickActions') }}</h3>
      <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <button class="flex items-center gap-3 p-4 rounded-xl bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 dark:hover:bg-slate-600 transition">
          <Plus class="w-6 h-6 text-blue-600" />
          <span class="font-semibold text-slate-800 dark:text-white">{{ t('home.newOrder') }}</span>
        </button>
        <button class="flex items-center gap-3 p-4 rounded-xl bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 dark:hover:bg-slate-600 transition">
          <Truck class="w-6 h-6 text-green-600" />
          <span class="font-semibold text-slate-800 dark:text-white">{{ t('home.shipment') }}</span>
        </button>
        <button class="flex items-center gap-3 p-4 rounded-xl bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 dark:hover:bg-slate-600 transition">
          <BarChart3 class="w-6 h-6 text-purple-600" />
          <span class="font-semibold text-slate-800 dark:text-white">{{ t('home.reports') }}</span>
        </button>
        <button class="flex items-center gap-3 p-4 rounded-xl bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 dark:hover:bg-slate-600 transition">
          <Settings class="w-6 h-6 text-orange-600" />
          <span class="font-semibold text-slate-800 dark:text-white">{{ t('home.settings') }}</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useI18n } from "vue-i18n";
import { DollarSign, Package, Layers, ShoppingCart, Plus, Truck, BarChart3, Settings } from "lucide-vue-next";

const { t } = useI18n();
</script>