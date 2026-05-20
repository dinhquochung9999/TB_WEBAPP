<template>
  <div class="embedded-app-container">
    <iframe
      src="https://192.168.40.105:5173/#/"
      title="External Application"
      class="embedded-iframe"
    />
  </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
.embedded-app-container {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
}

.embedded-iframe {
  flex: 1;
  border: none;
  width: 100%;
  height: 100%;
}
</style>
