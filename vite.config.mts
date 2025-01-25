import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  server: {
    host: '0.0.0.0', // Allows access from all network interfaces
    port: 3000,      // Optional: Specify the port
  },
  plugins: [
    RubyPlugin(),
    vue()
  ],
})
