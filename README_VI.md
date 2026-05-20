# My App - Vue 3 Dashboard

Ứng dụng web quản lý với giao diện hiện đại, hỗ trợ dark/light mode.

## Tính năng

✅ Dashboard chính với KPI cards  
✅ Dark/Light mode toggle  
✅ Sidebar responsive (fixed position, collapse)  
✅ Footer cố định  
✅ Đa ngôn ngữ (EN, VI, ZH)  
✅ Trang Profile & Settings  
✅ Nhúng ứng dụng ngoài (iframe)  
✅ Navbar với user dropdown  

## Cài đặt & Chạy

### 1. Cài đặt dependencies
```bash
npm install
```

### 2. Chạy dev server
```bash
npm run dev
```
Mở http://localhost:5173 (hoặc port khác được hiển thị)

### 3. Build for production
```bash
npm run build
```

## Push lên GitHub

Chạy file `push-to-github.bat` (Windows) hoặc chạy các lệnh git thủ công:

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/dinhquochung9999/TB_WEBAPP.git
git branch -M main
git push -u origin main
```

## Cấu trúc Thư mục

```
src/
├── components/      # Vue components (Navbar, Sidebar, Footer, etc.)
├── layouts/         # Layout components
├── views/           # Page components
├── router/          # Vue Router config
├── locales/         # Đa ngôn ngữ
├── assets/          # Images, SVG
└── App.vue          # Root component
```

## Các trang

- `/` - Trang chủ (Dashboard)
- `/app` - Embedded App
- `/external` - External App (5198)
- `/another` - Another App (5199)
- `/profile` - Hồ sơ cá nhân
- `/settings` - Cài đặt
- `/login` - Đăng nhập

## Công nghệ sử dụng

- Vue 3
- TypeScript
- Tailwind CSS
- Vue Router
- Vue i18n
- Lucide Icons
- Vite

## Lưu ý

- Giao diện sidebar cố định (fixed) và không cuộn theo nội dung
- Footer cố định ở dưới cùng màn hình
- Dark mode được lưu trong localStorage
- Iframe có thể bị chặn CORS nếu server không cho phép
